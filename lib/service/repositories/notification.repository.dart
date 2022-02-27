import 'dart:async';
import 'dart:io';

import 'package:broody/core/extensions/date_time.x.dart';
import 'package:broody/model/notification/notification_on_date.dart';
import 'package:broody/model/project/project.dart';
import 'package:dartx/dartx.dart' as x;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final notificationRepositoryProvider = Provider.autoDispose((ref) {
  final repo = NotificationRepository();
  return repo;
});

class NotificationRepository {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  Future<bool> _init() async {
    try {
      tz.initializeTimeZones();
      final currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(currentTimeZone));
      // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      final IOSInitializationSettings initializationSettingsIOS =
          IOSInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );
      const MacOSInitializationSettings initializationSettingsMacOS =
          MacOSInitializationSettings(
              requestAlertPermission: false,
              requestBadgePermission: false,
              requestSoundPermission: false);
      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: initializationSettingsAndroid,
              iOS: initializationSettingsIOS,
              macOS: initializationSettingsMacOS);
      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: onSelectNotification);

      print("Notification Repo Initialized!");
      return true;
    } catch (e) {
      print("Error during Notification Initialization: $e");
      return false;
    }
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  void onSelectNotification(String? payload) {}

  Future<bool> ensurePermission() async {
    debugPrint("Checking Notification Permission...");
    var res = true;
    if (Platform.isIOS) {
      res = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;
    }
    if (Platform.isMacOS) {
      res = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  MacOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;
    }

    return res;
  }

  Future<void> scheduleNotifications({
    required List<Project> projects,
    required List<String> projectsWithEntryToday,
    required L10n l10n,
  }) async {
    if (!_isInitialized) {
      _isInitialized = await _init();
      if (!_isInitialized) {
        return;
      }
    }
    await cancelAll();
    final projectsWithNotification =
        projects.where((p) => p.notificationTime != null);

    final notifications = <NotificationOnDate>[];
    final now = DateTime.now();
    if (projectsWithNotification.isEmpty) return;
    for (int i = 0; i < 64 ~/ projectsWithNotification.length; i++) {
      var currentDate = now.add(Duration(days: i));
      for (var project in projectsWithNotification) {
        final isFirst = currentDate.isAtSameDayAs(project.startDate);
        currentDate = currentDate.copyWith(
          hour: project.notificationTime!.hour,
          minute: project.notificationTime!.minute,
          second: 0,
          millisecond: 0,
        );

        // Current date is today and project has an entry today
        final todayAndDone = (currentDate.isSameDayAs(now) &&
            projectsWithEntryToday.contains(project.uid));

        // Current date is after this project ended
        final afterEnd =
            project.endDate.startOfDay().isBefore(currentDate.startOfDay());

        // Current date is still before the project started
        final beforeStart =
            project.startDate.startOfDay().isAfter(currentDate.startOfDay());

        if (currentDate.isAfter(now) &&
            !afterEnd &&
            !beforeStart &&
            !todayAndDone) {
          notifications.add(
            NotificationOnDate(
              dateTime: currentDate.copyWith(
                  hour: project.notificationTime!.hour,
                  minute: project.notificationTime!.minute),
              title: project.title,
              body: isFirst
                  ? l10n.reminderBodyForProjectStart
                  : l10n.reminderBodyForProject,
            ),
          );
        }
      }
    }

    if (!await ensurePermission()) throw "No Permission!";

    await _scheduleNotifications(
      notifications: notifications,
      checkPermission: false,
    );
  }

  Future<void> _scheduleNotifications({
    required List<NotificationOnDate> notifications,
    bool checkPermission = true,
  }) async {
    if (checkPermission && !(await ensurePermission())) return;
    var sortedNotifications = notifications.sortedBy((n) => n.dateTime);
    debugPrint("Scheduling ${sortedNotifications.count()} notifications");
    await Future.wait(sortedNotifications.mapIndexed(
        (i, n) => _scheduleNotification(i, n, checkPermission: false)));
  }

  Future<void> _scheduleNotification(int id, NotificationOnDate notification,
      {bool checkPermission = true}) async {
    if (checkPermission && !(await ensurePermission())) return;
    final time = tz.TZDateTime.from(notification.dateTime, tz.local);
    debugPrint("Scheduling $id for $time");
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        notification.title,
        notification.body,
        time,
        const NotificationDetails(
            android: AndroidNotificationDetails(
              'Broody',
              'Broody',
            ),
            iOS: IOSNotificationDetails(
              presentAlert: true,
            )),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
    debugPrint("Canceled all Notifications");
  }
}

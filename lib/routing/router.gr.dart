// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/widgets.dart' as _i21;
import 'package:photo_manager/photo_manager.dart' as _i23;
import 'package:video_player/video_player.dart' as _i24;

import '../model/entry/entry.dart' as _i22;
import '../model/project/project.dart' as _i25;
import '../ui/creating_compilation/create_compilation.page.dart' as _i8;
import '../ui/creating_compilation/pages/video_full_screen.page.dart' as _i9;
import '../ui/entry/entry.page.dart' as _i5;
import '../ui/home/home.page.dart' as _i1;
import '../ui/info/month_complete_info.page.dart' as _i12;
import '../ui/info/no_permission_info.page.dart' as _i13;
import '../ui/loading_from_cloud/loading_from_cloud.page.dart' as _i7;
import '../ui/onboarding/onboarding.page.dart' as _i4;
import '../ui/project/projects.page.dart' as _i2;
import '../ui/project_details/project_details.page.dart' as _i3;
import '../ui/theme/transitions.dart' as _i20;
import '../ui/update_entries/update_entries.page.dart' as _i11;
import '../ui/video_editor/video_editor.page.dart' as _i10;
import '../ui/video_picker/video_picker.page.dart' as _i6;
import 'route_guards/no_permissions.guard.dart' as _i18;
import 'route_guards/no_projects.guard.dart' as _i16;
import 'route_guards/no_selected_project.guard.dart' as _i17;
import 'route_guards/outdated_entries.guard.dart' as _i19;

class AppRouter extends _i14.RootStackRouter {
  AppRouter(
      {_i15.GlobalKey<_i15.NavigatorState>? navigatorKey,
      required this.noProjectsGuard,
      required this.noSelectedProjectGuard,
      required this.noPermissionsGuard,
      required this.outdatedEntriesGuard})
      : super(navigatorKey);

  final _i16.NoProjectsGuard noProjectsGuard;

  final _i17.NoSelectedProjectGuard noSelectedProjectGuard;

  final _i18.NoPermissionsGuard noPermissionsGuard;

  final _i19.OutdatedEntriesGuard outdatedEntriesGuard;

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ProjectsRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ProjectsPage());
    },
    ProjectDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailsRouteArgs>(
          orElse: () => const ProjectDetailsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ProjectDetailsPage(
              key: args.key, projectToEdit: args.projectToEdit),
          fullscreenDialog: true);
    },
    OnboardingRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.OnboardingPage());
    },
    EntryRoute.name: (routeData) {
      final args = routeData.argsAs<EntryRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.EntryPage(
              key: args.key,
              entry: args.entry,
              projectId: args.projectId,
              date: args.date),
          fullscreenDialog: true,
          transitionsBuilder: _i20.fadeThroughTransition,
          durationInMilliseconds: 500,
          opaque: false,
          barrierDismissible: false);
    },
    VideoPickerRoute.name: (routeData) {
      final args = routeData.argsAs<VideoPickerRouteArgs>(
          orElse: () => const VideoPickerRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.VideoPickerPage(key: args.key, forDate: args.forDate));
    },
    LoadingFromCloudRoute.name: (routeData) {
      final args = routeData.argsAs<LoadingFromCloudRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.LoadingFromCloudPage(
              key: args.key, assetEntity: args.assetEntity),
          fullscreenDialog: true,
          transitionsBuilder: _i20.fadeThroughTransitionTransparent,
          opaque: true,
          barrierDismissible: false);
    },
    CreateCompilationRoute.name: (routeData) {
      final args = routeData.argsAs<CreateCompilationRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.CreateCompilationPage(
              projectUid: args.projectUid,
              monthOfYear: args.monthOfYear,
              key: args.key),
          fullscreenDialog: true,
          transitionsBuilder: _i20.fadeThroughTransitionTransparent,
          opaque: true,
          barrierDismissible: false);
    },
    VideoFullScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VideoFullScreenRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.VideoFullScreenPage(
              key: args.key, controller: args.controller),
          fullscreenDialog: true,
          transitionsBuilder: _i20.fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    },
    VideoEditorRoute.name: (routeData) {
      final args = routeData.argsAs<VideoEditorRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i10.VideoEditorPage(
              assetEntity: args.assetEntity, key: args.key),
          fullscreenDialog: true,
          transitionsBuilder: _i20.fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    },
    UpdateEntriesRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateEntriesRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i11.UpdateEntriesPage(key: args.key, project: args.project),
          fullscreenDialog: true,
          transitionsBuilder: _i20.fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    },
    MonthCompleteInfoRoute.name: (routeData) {
      final args = routeData.argsAs<MonthCompleteInfoRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i12.MonthCompleteInfoPage(
              key: args.key, monthOfYear: args.monthOfYear),
          fullscreenDialog: true,
          transitionsBuilder: _i20.fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    },
    NoPermissionInfoRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i13.NoPermissionInfoPage(),
          fullscreenDialog: true,
          transitionsBuilder: _i20.fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(HomeRoute.name, path: '/', guards: [
          noProjectsGuard,
          noSelectedProjectGuard,
          noPermissionsGuard,
          outdatedEntriesGuard
        ]),
        _i14.RouteConfig(ProjectsRoute.name,
            path: '/projects', guards: [noPermissionsGuard, noProjectsGuard]),
        _i14.RouteConfig(ProjectDetailsRoute.name,
            path: '/new-project', guards: [noPermissionsGuard]),
        _i14.RouteConfig(OnboardingRoute.name, path: '/welcome'),
        _i14.RouteConfig(EntryRoute.name, path: '/entry'),
        _i14.RouteConfig(VideoPickerRoute.name, path: '/pick'),
        _i14.RouteConfig(LoadingFromCloudRoute.name, path: '/load'),
        _i14.RouteConfig(CreateCompilationRoute.name, path: '/export'),
        _i14.RouteConfig(VideoFullScreenRoute.name, path: '/view-export'),
        _i14.RouteConfig(VideoEditorRoute.name, path: '/edit'),
        _i14.RouteConfig(UpdateEntriesRoute.name, path: '/update-entries'),
        _i14.RouteConfig(MonthCompleteInfoRoute.name, path: '/month-complete'),
        _i14.RouteConfig(NoPermissionInfoRoute.name, path: '/no-permission')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ProjectsPage]
class ProjectsRoute extends _i14.PageRouteInfo<void> {
  const ProjectsRoute() : super(ProjectsRoute.name, path: '/projects');

  static const String name = 'ProjectsRoute';
}

/// generated route for
/// [_i3.ProjectDetailsPage]
class ProjectDetailsRoute extends _i14.PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({_i21.Key? key, String? projectToEdit})
      : super(ProjectDetailsRoute.name,
            path: '/new-project',
            args: ProjectDetailsRouteArgs(
                key: key, projectToEdit: projectToEdit));

  static const String name = 'ProjectDetailsRoute';
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({this.key, this.projectToEdit});

  final _i21.Key? key;

  final String? projectToEdit;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, projectToEdit: $projectToEdit}';
  }
}

/// generated route for
/// [_i4.OnboardingPage]
class OnboardingRoute extends _i14.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/welcome');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i5.EntryPage]
class EntryRoute extends _i14.PageRouteInfo<EntryRouteArgs> {
  EntryRoute(
      {_i21.Key? key,
      _i22.SavedEntry? entry,
      required String projectId,
      required DateTime date})
      : super(EntryRoute.name,
            path: '/entry',
            args: EntryRouteArgs(
                key: key, entry: entry, projectId: projectId, date: date));

  static const String name = 'EntryRoute';
}

class EntryRouteArgs {
  const EntryRouteArgs(
      {this.key, this.entry, required this.projectId, required this.date});

  final _i21.Key? key;

  final _i22.SavedEntry? entry;

  final String projectId;

  final DateTime date;

  @override
  String toString() {
    return 'EntryRouteArgs{key: $key, entry: $entry, projectId: $projectId, date: $date}';
  }
}

/// generated route for
/// [_i6.VideoPickerPage]
class VideoPickerRoute extends _i14.PageRouteInfo<VideoPickerRouteArgs> {
  VideoPickerRoute({_i21.Key? key, DateTime? forDate})
      : super(VideoPickerRoute.name,
            path: '/pick',
            args: VideoPickerRouteArgs(key: key, forDate: forDate));

  static const String name = 'VideoPickerRoute';
}

class VideoPickerRouteArgs {
  const VideoPickerRouteArgs({this.key, this.forDate});

  final _i21.Key? key;

  final DateTime? forDate;

  @override
  String toString() {
    return 'VideoPickerRouteArgs{key: $key, forDate: $forDate}';
  }
}

/// generated route for
/// [_i7.LoadingFromCloudPage]
class LoadingFromCloudRoute
    extends _i14.PageRouteInfo<LoadingFromCloudRouteArgs> {
  LoadingFromCloudRoute({_i21.Key? key, required _i23.AssetEntity assetEntity})
      : super(LoadingFromCloudRoute.name,
            path: '/load',
            args:
                LoadingFromCloudRouteArgs(key: key, assetEntity: assetEntity));

  static const String name = 'LoadingFromCloudRoute';
}

class LoadingFromCloudRouteArgs {
  const LoadingFromCloudRouteArgs({this.key, required this.assetEntity});

  final _i21.Key? key;

  final _i23.AssetEntity assetEntity;

  @override
  String toString() {
    return 'LoadingFromCloudRouteArgs{key: $key, assetEntity: $assetEntity}';
  }
}

/// generated route for
/// [_i8.CreateCompilationPage]
class CreateCompilationRoute
    extends _i14.PageRouteInfo<CreateCompilationRouteArgs> {
  CreateCompilationRoute(
      {required String projectUid, DateTime? monthOfYear, _i21.Key? key})
      : super(CreateCompilationRoute.name,
            path: '/export',
            args: CreateCompilationRouteArgs(
                projectUid: projectUid, monthOfYear: monthOfYear, key: key));

  static const String name = 'CreateCompilationRoute';
}

class CreateCompilationRouteArgs {
  const CreateCompilationRouteArgs(
      {required this.projectUid, this.monthOfYear, this.key});

  final String projectUid;

  final DateTime? monthOfYear;

  final _i21.Key? key;

  @override
  String toString() {
    return 'CreateCompilationRouteArgs{projectUid: $projectUid, monthOfYear: $monthOfYear, key: $key}';
  }
}

/// generated route for
/// [_i9.VideoFullScreenPage]
class VideoFullScreenRoute
    extends _i14.PageRouteInfo<VideoFullScreenRouteArgs> {
  VideoFullScreenRoute(
      {_i21.Key? key, required _i24.VideoPlayerController controller})
      : super(VideoFullScreenRoute.name,
            path: '/view-export',
            args: VideoFullScreenRouteArgs(key: key, controller: controller));

  static const String name = 'VideoFullScreenRoute';
}

class VideoFullScreenRouteArgs {
  const VideoFullScreenRouteArgs({this.key, required this.controller});

  final _i21.Key? key;

  final _i24.VideoPlayerController controller;

  @override
  String toString() {
    return 'VideoFullScreenRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i10.VideoEditorPage]
class VideoEditorRoute extends _i14.PageRouteInfo<VideoEditorRouteArgs> {
  VideoEditorRoute({required _i23.AssetEntity assetEntity, _i21.Key? key})
      : super(VideoEditorRoute.name,
            path: '/edit',
            args: VideoEditorRouteArgs(assetEntity: assetEntity, key: key));

  static const String name = 'VideoEditorRoute';
}

class VideoEditorRouteArgs {
  const VideoEditorRouteArgs({required this.assetEntity, this.key});

  final _i23.AssetEntity assetEntity;

  final _i21.Key? key;

  @override
  String toString() {
    return 'VideoEditorRouteArgs{assetEntity: $assetEntity, key: $key}';
  }
}

/// generated route for
/// [_i11.UpdateEntriesPage]
class UpdateEntriesRoute extends _i14.PageRouteInfo<UpdateEntriesRouteArgs> {
  UpdateEntriesRoute({_i21.Key? key, required _i25.Project project})
      : super(UpdateEntriesRoute.name,
            path: '/update-entries',
            args: UpdateEntriesRouteArgs(key: key, project: project));

  static const String name = 'UpdateEntriesRoute';
}

class UpdateEntriesRouteArgs {
  const UpdateEntriesRouteArgs({this.key, required this.project});

  final _i21.Key? key;

  final _i25.Project project;

  @override
  String toString() {
    return 'UpdateEntriesRouteArgs{key: $key, project: $project}';
  }
}

/// generated route for
/// [_i12.MonthCompleteInfoPage]
class MonthCompleteInfoRoute
    extends _i14.PageRouteInfo<MonthCompleteInfoRouteArgs> {
  MonthCompleteInfoRoute({_i21.Key? key, required DateTime monthOfYear})
      : super(MonthCompleteInfoRoute.name,
            path: '/month-complete',
            args:
                MonthCompleteInfoRouteArgs(key: key, monthOfYear: monthOfYear));

  static const String name = 'MonthCompleteInfoRoute';
}

class MonthCompleteInfoRouteArgs {
  const MonthCompleteInfoRouteArgs({this.key, required this.monthOfYear});

  final _i21.Key? key;

  final DateTime monthOfYear;

  @override
  String toString() {
    return 'MonthCompleteInfoRouteArgs{key: $key, monthOfYear: $monthOfYear}';
  }
}

/// generated route for
/// [_i13.NoPermissionInfoPage]
class NoPermissionInfoRoute extends _i14.PageRouteInfo<void> {
  const NoPermissionInfoRoute()
      : super(NoPermissionInfoRoute.name, path: '/no-permission');

  static const String name = 'NoPermissionInfoRoute';
}

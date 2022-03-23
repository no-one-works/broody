import 'package:broody/core/constants/box_keys.dart';
import 'package:broody/model/compilation/compilation.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/model/onboarding/onboarding.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/service/datasources/compilation/compilation.datasource.dart';
import 'package:broody/service/datasources/entry/entry.datasource.dart';
import 'package:broody/service/datasources/project/project.datasource.dart';
import 'package:broody/service/repositories/onboarding.repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:photo_manager/photo_manager.dart';

class LocalStorageHelper {
  static Future<void> initLocalStorage() async {
    await PhotoManager.clearFileCache();
    await Hive.initFlutter();
    //await Hive.deleteBoxFromDisk(compilationBoxKey);
    //await Hive.deleteBoxFromDisk(onboardingBoxKey);
    //await Hive.deleteBoxFromDisk(compilationBoxKey);
    Hive.registerAdapter(ProjectAdapter());
    Hive.registerAdapter(EntryAdapter());
    Hive.registerAdapter(SavedCompilationAdapter());
    Hive.registerAdapter(OnboardingAdapter());

    await Future.wait([
      Hive.openBox<Project>(projectBoxKey),
      Hive.openBox<String>(activeProjectBoxKey),
      Hive.openBox<SavedCompilation>(compilationBoxKey),
      Hive.openBox<Onboarding>(onboardingBoxKey),
    ]);
    await Future.wait(Hive.box<Project>(projectBoxKey)
        .values
        .map((p) => entryBoxKey(p.uid))
        .map((key) => Hive.openBox<SavedEntry>(key)));
  }
}

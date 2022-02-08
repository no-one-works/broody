import 'dart:async';
import 'dart:convert';

import 'package:broody/core/constants/box_keys.dart';
import 'package:broody/core/constants/box_type_ids.dart';
import 'package:broody/model/onboarding/onboarding.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

abstract class IOnboardingRepository {
  Onboarding get onboardingConfig;

  Stream<Onboarding> get onboardingConfig$;

  FutureOr<void> setOnboardingConfig(Onboarding value);
}

final onboardingRepositoryProvider =
    Provider<IOnboardingRepository>((ref) => OnboardingRepository());

class OnboardingRepository implements IOnboardingRepository {
  final Box<Onboarding> _box = Hive.box<Onboarding>(onboardingBoxKey);

  @override
  Onboarding get onboardingConfig => _box.get(
        onboardingBoxKey,
        defaultValue: const Onboarding(),
      )!;

  @override
  Stream<Onboarding> get onboardingConfig$ => _box
      .watch(key: onboardingBoxKey)
      .map((_) => onboardingConfig)
      .startWith(onboardingConfig);

  @override
  FutureOr<void> setOnboardingConfig(Onboarding value) =>
      _box.put(onboardingBoxKey, value);
}

class OnboardingAdapter extends TypeAdapter<Onboarding> {
  @override
  int get typeId => onboardingTypeId;

  @override
  Onboarding read(BinaryReader reader) {
    return Onboarding.fromJson(jsonDecode(reader.readString()));
  }

  @override
  void write(BinaryWriter writer, Onboarding obj) {
    writer.writeString(jsonEncode(obj.toJson()));
  }
}

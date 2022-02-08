import 'package:broody/service/providers/onboarding.providers.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final showRevealOnboardingProvider = Provider.autoDispose<bool>((ref) {
  final entries = ref.watch(selectedProjectEntriesProvider);
  final entryCount = entries.value?.length ?? 0;
  if (entryCount < 2) return false;
  final onboardingConfig = ref.watch(onboardingConfigProvider);
  return !(onboardingConfig.value?.knowsTwoFingerSwipe ?? true);
});

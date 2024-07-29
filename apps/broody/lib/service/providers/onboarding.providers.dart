import 'package:broody/service/repositories/onboarding.repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final onboardingConfigProvider = StreamProvider.autoDispose((ref) {
  final repo = ref.watch(onboardingRepositoryProvider);
  return repo.onboardingConfig$;
});

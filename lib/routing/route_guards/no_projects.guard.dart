import 'package:auto_route/auto_route.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/repositories/project.repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoProjectsGuard extends AutoRouteGuard {
  NoProjectsGuard(this.ref);

  final Ref ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final projects = ref.read(projectRepositoryProvider).projects;
    if (projects.isEmpty) {
      resolver.next(false);
      await router.push(
        const OnboardingRoute(),
      );
    } else {
      resolver.next(true);
    }
  }
}

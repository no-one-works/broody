import 'package:auto_route/auto_route.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/repositories/project.repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoProjectsGuard extends AutoRouteGuard {
  NoProjectsGuard(this._reader);

  final Reader _reader;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final projects = _reader(projectRepositoryProvider).projects;
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

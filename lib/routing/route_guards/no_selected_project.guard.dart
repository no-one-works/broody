import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoSelectedProjectGuard extends AutoRouteGuard {
  NoSelectedProjectGuard(this.ref);

  final Ref ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final activeProject = ref.read(selectedProjectProvider);
    if (activeProject == null) {
      resolver.next(false);
      await router.push(const ProjectsRoute());
    } else {
      resolver.next(true);
    }
  }
}

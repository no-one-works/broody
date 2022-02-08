import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoSelectedProjectGuard extends AutoRouteGuard {
  NoSelectedProjectGuard(this._reader);

  final Reader _reader;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final activeProject = _reader(selectedProjectProvider);
    if (activeProject == null) {
      resolver.next(false);
      await router.push(const ProjectsRoute());
    } else {
      resolver.next(true);
    }
  }
}

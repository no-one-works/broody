import 'package:auto_route/auto_route.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OutdatedEntriesGuard extends AutoRouteGuard {
  OutdatedEntriesGuard(this._reader);

  final Reader _reader;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final selectedProject = _reader(selectedProjectProvider);
    if (selectedProject == null) {
      resolver.next(true);
      return;
    }
    final outdatedEntries = await _reader(
        projectOutdatedEntriesProvider(selectedProject.uid).future);
    resolver.next(true);
    if (outdatedEntries.isNotEmpty) {
      router.push(
        UpdateEntriesRoute(
          project: selectedProject,
        ),
      );
    }
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OutdatedEntriesGuard extends AutoRouteGuard {
  OutdatedEntriesGuard(this.ref);

  final Ref ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final selectedProject = ref.read(selectedProjectProvider);
    if (selectedProject == null) {
      resolver.next(true);
      return;
    }
    final outdatedEntries = await ref
        .read(projectOutdatedEntriesProvider(selectedProject.uid).future);
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

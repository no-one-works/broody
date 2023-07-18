import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/ui/project/widgets/projects_list.dart';
import 'package:broody/ui/shared/dialogs/about_dialog.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectsPage extends HookConsumerWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    final projects = ref.watch(projectsProvider).asData?.value ?? [];

    return Scaffold(
      backgroundColor: colorScheme.background,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () => context.router.push(ProjectDetailsRoute()),
        label: Text(l10n.createProject),
        icon: const Icon(Icons.add_rounded),
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                l10n.myProjects,
                style: textTheme.headline4,
              ),
              backgroundColor: colorScheme.background,
              leadingWidth: Spacers.x2l,
              floating: true,
              actions: [
                IconButton(
                    onPressed: () => showLicenseDialog(context, ref),
                    icon: const Icon(Icons.info_outline_rounded))
              ],
            ),
            if (projects.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(Spacers.l),
                  child: Text(l10n.myProjectsSubtitle),
                ),
              ),
            if (projects.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(Spacers.l),
                  child: Text(l10n.myProjectsEmpty),
                ),
              ),
            if (projects.isNotEmpty)
              ProjectList(
                projects: projects,
              )
          ],
        ),
      ),
    );
  }
}

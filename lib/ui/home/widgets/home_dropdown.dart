import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/spacing.dart';

class HomeDropdown extends HookConsumerWidget {
  const HomeDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final colorScheme = useColorScheme();
    final selectedProject = ref.watch(selectedProjectProvider);

    return PopupMenuButton(
      icon: const HeroIcon(HeroIcons.dotsVertical),
      padding: EdgeInsets.zero,
      color: colorScheme.surface,
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () => context.router.navigate(const ProjectsRoute()),
          child: _buildListTile(
            context,
            Icons.collections_bookmark_rounded,
            l10n.myProjects,
          ),
        ),
        PopupMenuItem(
          onTap: () => context.router.navigate(
              ProjectDetailsRoute(projectToEdit: selectedProject!.uid)),
          child: _buildListTile(
            context,
            Icons.edit_rounded,
            l10n.editProject,
          ),
        ),
        PopupMenuItem(
          onTap: () => context.router.navigate(
            CreateCompilationRoute(
              projectUid: selectedProject!.uid,
            ),
          ),
          child: _buildListTile(
            context,
            Icons.movie_filter_rounded,
            l10n.exportCompilation,
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String text) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Spacers.xxs,
        vertical: Spacers.em,
      ),
      leading: Icon(
        icon,
        color: colorScheme.secondary,
      ),
      minLeadingWidth: Spacers.s,
      title: Text(text),
    );
  }
}

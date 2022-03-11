import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/ui/project/widgets/project_list_tile.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ProjectList extends HookConsumerWidget {
  const ProjectList({
    Key? key,
    required this.projects,
  }) : super(key: key);
  final List<Project> projects;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    final activeProjects =
        projects.where((p) => !ref.read(projectHasEndedProvider(p))).toList();
    final endedProjects =
        projects.where((p) => ref.read(projectHasEndedProvider(p))).toList();
    return DefaultTextStyle(
      style: textTheme.button!.copyWith(color: colorScheme.secondary),
      child: MultiSliver(
        children: [
          if (activeProjects.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacers.l),
              child: Text(l10n.activeProjects),
            ),
          _buildList(context, ref, activeProjects),
          if (endedProjects.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                left: Spacers.l,
                right: Spacers.l,
                top: Spacers.l,
              ),
              child: Text(l10n.endedProjects),
            ),
          _buildList(context, ref, endedProjects),
        ],
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    WidgetRef ref,
    List<Project> projects,
  ) {
    return SliverImplicitlyAnimatedList<Project>(
      items: projects,
      areItemsTheSame: (oldItem, newItem) => oldItem.uid == newItem.uid,
      removeItemBuilder: (context, animation, project) {
        return SizeFadeTransition(
          animation: animation,
          sizeFraction: 0.5,
          curve: Curves.ease,
          child: ProjectListTile(
            project: project,
            blurHash: "K6Pj42jE.A_3t7t7*0o#Dg",
            onTap: () {},
          ),
        );
      },
      itemBuilder: (context, animation, item, i) {
        final entries =
            ref.watch(projectEntriesProvider(projects[i].uid)).asData?.value ??
                [];
        final blurHash = entries.isNotEmpty
            ? entries.last.blurHash
            : "K6Pj42jE.A_3t7t7*0o#Dg";
        return SizeFadeTransition(
          animation: animation,
          sizeFraction: 0.5,
          curve: Curves.ease,
          child: ProjectListTile(
            project: item,
            blurHash: blurHash,
            onTap: () {
              ref.read(selectedProjectProvider.notifier).state = projects[i];
              return context.router.replaceAll([const HomeRoute()]);
            },
          ),
        );
      },
    );
  }
}

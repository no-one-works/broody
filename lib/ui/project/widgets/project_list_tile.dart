import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/ui/shared/providers/color/color.providers.dart';
import 'package:broody/ui/shared/providers/color/request/color_scheme_request.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ProjectListTile extends HookConsumerWidget {
  const ProjectListTile(
      {Key? key, required this.project, required this.blurHash, this.onTap})
      : super(key: key);

  final Project project;
  final String blurHash;

  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = useTextTheme();
    final themeColorScheme = useColorScheme();
    final colorScheme = ref.watch(
      colorSchemeProvider(
        ColorSchemeRequest.project(
          project: project,
          brightness: themeColorScheme.brightness,
        ),
      ),
    );
    final selected = ref.watch(selectedProjectProvider)?.uid == project.uid;
    final dateFormat = useDateFormat(DateFormat.ABBR_MONTH_DAY);
    final entryCount = ref.watch(projectEntriesProvider(project.uid)
        .select((e) => e.value?.length ?? 0));

    return ListTile(
      onTap: onTap,
      leading: Hero(
        tag: project.uid,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              shape: const CircleBorder(),
              shadowColor: colorScheme.shadow,
              elevation: selected ? 6 : 0,
              margin: EdgeInsets.zero,
              child: SizedBox(
                width: Spacers.xl + Spacers.s,
                child: Image(
                  image: BlurHashImage(blurHash),
                  fit: BoxFit.cover,
                  color: selected ? colorScheme.primary : colorScheme.secondary,
                  colorBlendMode: BlendMode.color,
                ),
              ),
            ),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: Spacers.l),
      title: Text(project.title,
          style: textTheme.subtitle1!.copyWith(
            fontWeight: selected ? FontWeight.w700 : null,
          )),
      subtitle: IconTheme(
        data: IconThemeData(
          color: colorScheme.secondary,
          size: Spacers.s,
        ),
        child: Row(
          children: [
            Row(
              children: [
                const Icon(Icons.play_arrow_rounded),
                hSpace(Spacers.xxs),
                Text(
                  dateFormat.format(project.startDate),
                  style: textTheme.bodyText2?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            hSpace(Spacers.s),
            Row(
              children: [
                const Icon(Icons.stop_rounded),
                hSpace(Spacers.xxs),
                Text(
                  dateFormat.format(project.endDate),
                  style: textTheme.bodyText2?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            hSpace(Spacers.s),
            Row(
              children: [
                const Icon(Icons.theaters_rounded),
                hSpace(Spacers.xxs),
                Text(
                  "$entryCount/${project.numberOfClips}",
                  style: textTheme.bodyText2?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      trailing: IconButton(
        color: colorScheme.secondary,
        icon: const Icon(
          Icons.edit_rounded,
        ),
        onPressed: () {
          context.router
              .navigate(ProjectDetailsRoute(projectToEdit: project.uid));
        },
      ),
    );
  }
}

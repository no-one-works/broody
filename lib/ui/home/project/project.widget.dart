import 'dart:io';

import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/ui/shared/animated_scale_switcher/animated_scale_switcher.dart';
import 'package:broody/ui/shared/snapback_interactive_viewer.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ProjectWidget extends HookConsumerWidget {
  const ProjectWidget({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  final animationDuration = kThemeAnimationDuration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    final deleted = useState(false);
    return AnimatedScaleSwitcher(
      duration: animationDuration,
      child: deleted.value
          ? const SizedBox()
          : Card(
              shadowColor: colorScheme.shadow,
              color: Colors.white,
              clipBehavior: Clip.hardEdge,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Spacers.m),
              ),
              margin: const EdgeInsets.symmetric(
                vertical: Spacers.m,
                horizontal: Spacers.xs,
              ),
              child: InkWell(
                onTap: () => {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacers.l,
                        vertical: Spacers.m,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.title,
                                  style: textTheme.headline6,
                                ),
                                Text(
                                  DateFormat.yMMMd(l10n.localeName)
                                      .add_jm()
                                      .format(project.startDate),
                                  style: textTheme.button?.copyWith(
                                    color: colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SnapbackInteractiveViewer(
                      clipBehavior: Clip.hardEdge,
                      maxScale: 4,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        //TODO better aspect ratio
                        child: SizedBox(
                          width: 1080,
                          height: 1920,
                          child: Hero(
                            tag: project.uid,
                            child: project.thumbnailPath != null
                                ? Image.file(
                                    File(project.thumbnailPath!),
                                    fit: BoxFit.fill,
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

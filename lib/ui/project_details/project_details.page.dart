import 'dart:io';

import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/ui/project_details/project_details.notifier.dart';
import 'package:broody/ui/project_details/state/project_details.state.dart';
import 'package:broody/ui/project_details/widgets/project_color_picker.widget.dart';
import 'package:broody/ui/project_details/widgets/project_notifications_picker.widget.dart';
import 'package:broody/ui/project_details/widgets/video_orientation_picker.dart';
import 'package:broody/ui/shared/clip_duration_selector/clip_duration_selector.widget.dart';
import 'package:broody/ui/shared/dialogs/dialogs.dart';
import 'package:broody/ui/shared/providers/color/color.providers.dart';
import 'package:broody/ui/shared/providers/color/request/color_scheme_request.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ProjectDetailsPage extends HookConsumerWidget {
  const ProjectDetailsPage({
    Key? key,
    this.projectToEdit,
  }) : super(key: key);

  final String? projectToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = useTheme();
    final state = ref.watch(projectDetailsStateProvider(projectToEdit));
    final notifier =
        ref.watch(projectDetailsStateProvider(projectToEdit).notifier);
    final dateFormat = useDateFormat(DateFormat.YEAR_ABBR_MONTH_DAY);
    final titleController = useTextEditingController(text: state.project.title);
    final isRunning = state.project.startDate.isBefore(DateTime.now()) &&
        !ref.watch(projectHasEndedProvider(state.project));
    ref.listen(projectDetailsStateProvider(projectToEdit),
        (previous, next) async {
      if (next is ProjectDetailsSaved) {
        context.router.replaceAll([const HomeRoute()]);
      } else if (next is ProjectDetailsConfirmDestructive) {
        notifier.confirmDestructive(
            await showDestructiveProjectEditDialog(context, ref));
      }
    });

    return AnimatedTheme(
      data: theme.copyWith(
        colorScheme: ref.watch(
          colorSchemeProvider(
            ColorSchemeRequest.project(
              brightness: theme.brightness,
              project: state.project,
            ),
          ),
        ),
      ),
      child: HookBuilder(builder: (context) {
        final colorScheme = useColorScheme();
        return Scaffold(
          backgroundColor: colorScheme.surface,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: state.project.valid
              ? FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: () => notifier.save(),
                  label: Text(l10n.save),
                )
              : null,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  projectToEdit == null ? l10n.createProject : l10n.editProject,
                ),
                foregroundColor: colorScheme.onSurface,
                actions: [
                  if (state is ProjectDetailsEditing)
                    IconButton(
                      icon: Icon(isRunning ? Icons.stop : Icons.delete),
                      color: colorScheme.error,
                      onPressed: () async {
                        final changed = isRunning
                            ? await showEndProjectDialog(context, ref,
                                project: state.project)
                            : await showDeleteProjectDialog(context, ref,
                                project: state.project);
                        if (changed && !isRunning) {
                          notifier.deleteProject();
                          var selectedProjectUid = ref
                              .read(selectedProjectProvider.notifier)
                              .state
                              ?.uid;
                          if (state.project.uid == selectedProjectUid) {
                            //remove HomePage from stack - project was deleted
                            context.router.replaceAll([const ProjectsRoute()]);
                          } else {
                            context.router.pop();
                          }
                        } else if (changed && isRunning) {
                          notifier.endProject();
                        }
                      },
                    )
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSpace(Spacers.l),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Spacers.l),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: titleController,
                            onChanged: notifier.setTitle,
                            maxLength: 32,
                            autofocus: state is ProjectDetailsCreating,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              label: Text(l10n.title),
                              hintText: l10n.defaultProjectTitle,
                            ),
                          ),
                          vSpace(Spacers.xl),
                          if (state is ProjectDetailsCreating)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(l10n.clipDuration),
                                vSpace(Spacers.xs),
                                SizedBox(
                                  width: double.infinity,
                                  child: ClipDurationSelector(
                                    selected: state.project.entryDuration,
                                    onSelect: notifier.setEntryDuration,
                                  ),
                                ),
                                vSpace(Spacers.xl),
                              ],
                            ),
                          Text(
                            l10n.timePeriod,
                          ),
                          vSpace(Spacers.xxs),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () =>
                                      _pickStartDate(context, state, notifier),
                                  child: Text(dateFormat
                                      .format(state.project.startDate)),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: Spacers.s),
                                child: Icon(Icons.arrow_forward_rounded),
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () =>
                                      _pickEndDate(context, state, notifier),
                                  child: Text(
                                      dateFormat.format(state.project.endDate)),
                                ),
                              ),
                            ],
                          ),
                          ProjectNotificationsPicker(notifier: notifier),
                          // TODO Re-add this when our app is ready for landscape
                          if (state is ProjectDetailsCreating && false)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                vSpace(Spacers.l),
                                Text(l10n.videoOrientation),
                                vSpace(Spacers.xs),
                                SizedBox(
                                  width: double.infinity,
                                  child: VideoOrientationPicker(
                                    selected: state.project.portrait,
                                    onSelect: (p) =>
                                        notifier.setPortrait(p ?? true),
                                  ),
                                ),
                              ],
                            ),
                          vSpace(Spacers.l),
                          Text(l10n.projectColor),
                          //vSpace(Spacers.xxs),
                        ],
                      ),
                    ),
                    ProjectColorPicker(
                      selected: state.project.color != null
                          ? Color(state.project.color!)
                          : null,
                      onSelect: (c) => notifier.setColor(c.value),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Spacers.l),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          vSpace(Spacers.xl),
                          Text(
                            l10n.timePeriodVideos(
                              state.project.numberOfClips.toString(),
                              prettyDuration(
                                state.project.totalDuration,
                                locale: DurationLocale.fromLanguageCode(
                                    l10n.localeName)!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<void> _pickStartDate(
    BuildContext context,
    ProjectDetailsState state,
    ProjectDetailsNotifier notifier,
  ) async {
    final date = await _pickDate(context, date: state.project.startDate);
    if (date != null) {
      notifier.setStartDate(date);
    }
  }

  Future<void> _pickEndDate(
    BuildContext context,
    ProjectDetailsState state,
    ProjectDetailsNotifier notifier,
  ) async {
    final date = await _pickDate(
      context,
      firstDate: state.project.startDate.add(const Duration(days: 1)),
      date: state.project.endDate,
    );
    if (date != null) {
      notifier.setEndDate(date);
    }
  }

  Future<DateTime?> _pickDate(
    BuildContext context, {
    required DateTime date,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final langCode = Platform.localeName.split("_").first;
    return await showDatePicker(
      context: context,
      locale: Locale(langCode),
      initialDate: date,
      firstDate: firstDate ??
          date.subtract(
            const Duration(days: 10000),
          ),
      lastDate: lastDate ??
          date.add(
            const Duration(days: 10000),
          ),
    );
  }
}

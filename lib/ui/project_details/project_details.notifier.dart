import 'package:broody/core/extensions/date_time.x.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/service/repositories/notification.repository.dart';
import 'package:broody/service/repositories/project.repository.dart';
import 'package:broody/ui/project_details/state/project_details.state.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final projectDetailsStateProvider = StateNotifierProvider.autoDispose
    .family<ProjectDetailsNotifier, ProjectDetailsState, String?>(
        (ref, projectId) {
  final repo = ref.read(projectRepositoryProvider);
  final state = projectId == null || repo.getProject(projectId) == null
      ? ProjectDetailsState.creating(project: repo.newProject)
      : ProjectDetailsState.editing(project: repo.getProject(projectId)!);
  return ProjectDetailsNotifier(ref.read, state);
});

class ProjectDetailsNotifier extends StateNotifier<ProjectDetailsState> {
  ProjectDetailsNotifier(this._reader, ProjectDetailsState state)
      : super(state);

  final Reader _reader;

  bool get isCreating => state is ProjectDetailsCreating;

  void setTitle(String title) {
    if (state is ProjectDetailsSaved) return;
    state = state.copyWith.project(
      title: title,
    );
  }

  void setStartDate(DateTime date) {
    if (state is ProjectDetailsSaved) return;
    final duration = state.project.endDate.difference(state.project.startDate);
    state = state.copyWith.project(
      startDate: date,
      endDate: state.maybeMap(
        creating: (s) => date.add(duration),
        orElse: () => state.project.endDate,
      ),
    );
  }

  void setEndDate(DateTime date) {
    state = state.copyWith.project(
      endDate: date.endOfDay(),
    );
  }

  void endProject() {
    state = state.copyWith.project(
      endDate: DateTime.now(),
    );
    save();
  }

  void setColor(int colorValue) {
    if (state is ProjectDetailsSaved) return;
    state = state.copyWith.project(
      color: colorValue,
    );
  }

  void setEntryDuration(Duration? duration) {
    if (state is ProjectDetailsSaved || duration == null) return;
    state = state.copyWith.project(
      entryDuration: duration,
    );
  }

  void setPortrait(bool portrait) {
    if (state is ProjectDetailsSaved) return;
    state = state.copyWith.project(
      portrait: portrait,
    );
  }

  void setVideoResolution(Size? resolution) {
    if (state is ProjectDetailsSaved || resolution == null) return;
    state = state.copyWith.project(
      landScapeResolution: resolution,
    );
  }

  void setNotificationTime(TimeOfDay? time) {
    if (state is ProjectDetailsSaved || time == null) return;
    state = state.copyWith.project(
      notificationTime: DateTime(0, 0, 0, time.hour, time.minute),
    );
  }

  Future<bool> toggleNotifications(bool isEnabled) async {
    if (state is ProjectDetailsSaved) return false;
    final hasPermission =
        await _reader(notificationRepositoryProvider).ensurePermission();
    if (!hasPermission) {
      state = state.copyWith.project(
        notificationTime: null,
      );
    } else {
      var now = DateTime.now();
      state = state.copyWith.project(
        notificationTime: isEnabled ? DateTime(now.year, 0, 0, 12) : null,
      );
    }
    return hasPermission;
  }

  void deleteProject() {
    state = ProjectDetailsState.deleted(project: state.project);
    _reader(projectRepositoryProvider).deleteProject(state.project);
  }

  void save() async {
    if (state is ProjectDetailsConfirmDestructive) return;
    if (await _isDestructive()) {
      state = ProjectDetailsState.confirmDestructive(project: state.project);
      return;
    }
    await _save();
  }

  void confirmDestructive(bool confirm) async {
    if (state is! ProjectDetailsConfirmDestructive) return;
    if (confirm) {
      await _save();
    } else {
      state = ProjectDetailsState.editing(project: state.project);
    }
  }

  Future<bool> _isDestructive() async {
    if (state is ProjectDetailsSaved) return false;

    final currentProject =
        _reader(projectRepositoryProvider).getProject(state.project.uid);
    if (currentProject == null) return false;
    final lostDates =
        currentProject.startDate.getDaysUntil(currentProject.endDate).except(
              state.project.startDate.getDaysUntil(state.project.endDate),
            );
    if (lostDates.isEmpty) return false;
    final entries =
        await _reader(projectEntriesProvider(state.project.uid).future);
    return entries.map((e) => e.day).any(lostDates.contains);
  }

  Future<void> _save() async {
    if (state is ProjectDetailsSaved) return;
    await _reader(projectRepositoryProvider).setProject(state.project);
    _reader(selectedProjectProvider.notifier).state = state.project;
    state = ProjectDetailsState.saved(project: state.project);
  }
}

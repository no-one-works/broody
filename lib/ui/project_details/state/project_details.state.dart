import 'package:broody/model/project/project.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_details.state.freezed.dart';

@freezed
class ProjectDetailsState with _$ProjectDetailsState {
  const factory ProjectDetailsState.creating({
    required Project project,
  }) = ProjectDetailsCreating;

  const factory ProjectDetailsState.editing({
    required Project project,
  }) = ProjectDetailsEditing;

  const factory ProjectDetailsState.confirmDestructive({
    required Project project,
  }) = ProjectDetailsConfirmDestructive;

  const factory ProjectDetailsState.saved({
    required Project project,
  }) = ProjectDetailsSaved;

  const factory ProjectDetailsState.deleted({
    required Project project,
  }) = ProjectDetailsDeleted;
}

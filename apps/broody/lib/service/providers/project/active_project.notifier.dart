import 'package:broody/model/project/project.dart';
import 'package:broody/service/repositories/project.repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActiveProjectNotifier extends StateNotifier<Project?> {
  ActiveProjectNotifier(this.projectRepository)
      : super(projectRepository.activeProject) {
    projectRepository.activeProject$.listen((p) => state = p);
  }

  final ProjectRepository projectRepository;

  @override
  set state(value) {
    if (value != state) {
      projectRepository.setActiveProject(value);
      super.state = value;
    }
  }

  @override
  bool updateShouldNotify(Project? old, Project? current) => old != current;
}

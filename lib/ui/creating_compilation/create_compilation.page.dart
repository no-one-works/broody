import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/core/hook/use_wakelock.hook.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/ui/creating_compilation/create_compilation.notifier.dart';
import 'package:broody/ui/creating_compilation/state/create_compilation.state.dart';
import 'package:broody/ui/creating_compilation/widgets/compilation_success.widget.dart';
import 'package:broody/ui/shared/loading_value_progress_bar/loading_value_progress_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateCompilationPage extends HookConsumerWidget {
  CreateCompilationPage({
    required this.projectUid,
    this.monthOfYear,
    Key? key,
  }) : super(key: key);

  final String projectUid;
  final DateTime? monthOfYear;

  late final CreateCompilationState _initialState =
      CreateCompilationState.prepareExport(
    projectUid: projectUid,
    monthOfYear: monthOfYear,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final notifier =
        ref.watch(createCompilationStateProvider(_initialState).notifier);
    final state = ref.watch(createCompilationStateProvider(_initialState));
    final projectTitle = ref.watch(projectTitleProvider);
    final colorScheme = useColorScheme();

    useWakelock(endWhenCovered: false);
    return Scaffold(
      backgroundColor: colorScheme.secondaryContainer,
      appBar: AppBar(
        foregroundColor: colorScheme.secondary,
        title: Text(state.monthOfYear == null
            ? projectTitle
            : l10n.monthCompilation(projectTitle, monthOfYear!)),
      ),
      body: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: state.map(
          exporting: (state) => LoadingValueProgressBar(
            loadingValue: state.exportProgress,
            color: colorScheme.secondary,
            description: l10n.creatingCompilation,
          ),
          exportSuccess: (state) => CompilationSuccessWidget(
            key: const ValueKey(CreateCompilationExportSuccess),
            width: state.savedCompilation.width,
            height: state.savedCompilation.height,
            videoController: state.videoController,
            onSaveToGallery: () async => ScaffoldMessenger.of(context)
                .showSnackBar(await notifier.saveToGallery()
                    ? SnackBar(content: Text(l10n.saveToGallerySuccess))
                    : SnackBar(content: Text(l10n.saveToGalleryFailed))),
            onShare: notifier.share,
          ),
          exportFailed: (state) {
            return const Center(
              child: Icon(Icons.error_rounded),
            );
          },
          prepareExport: (state) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}

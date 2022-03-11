import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/service/repositories/video_gallery.repository.dart';
import 'package:broody/ui/shared/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecordButton extends HookConsumerWidget {
  const RecordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final recording = useState(false);
    return FloatingActionButton.extended(
      onPressed:
          recording.value ? null : () => _record(context, ref, recording),
      icon: const Icon(Icons.videocam_rounded),
      label: Text(l10n.record),
    );
  }

  Future<void> _record(BuildContext context, WidgetRef ref,
      ValueNotifier<bool> recording) async {
    if (recording.value) return;
    recording.value = true;
    final assetEntity =
        await ref.read(videoGalleryRepositoryProvider).recordVideo();
    final duration = ref.read(projectClipDurationProvider);
    recording.value = false;
    if (assetEntity == null || duration == null) return;
    if (assetEntity.videoDuration > duration) {
      await context.router.pushAll([
        VideoPickerRoute(),
        VideoEditorRoute(assetEntity: assetEntity),
      ]);
    } else {
      showClipTooShortDialog(context, ref, entity: assetEntity);
    }
  }
}

import 'dart:io';

import 'package:broody/core/extensions/date_time.x.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/entry.providers.dart';
import 'package:broody/service/providers/video/video_gallery.providers.dart';
import 'package:broody/ui/shared/dialogs/dialogs.dart';
import 'package:broody/ui/shared/record_button/record_button.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:broody/ui/video_picker/widgets/video_tile/video_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

class VideoPickerPage extends HookConsumerWidget {
  const VideoPickerPage({
    Key? key,
    this.forDate,
  }) : super(key: key);
  final DateTime? forDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final colorScheme = useColorScheme();
    final date = useMemoized(() => forDate ?? DateTime.now());
    final entry = ref.watch(entryForDateProvider(date));
    final videos = ref.watch(videosProvider(date));
    ref.listen<AsyncValue<List<AssetEntity>>>(videosProvider(date),
        (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          if (error is FileSystemException) {
            showMissingGalleryPermissionDialog(context, ref);
          }
        },
      );
    });

    final initialIndex = useMemoized(
        () => videos.asData?.value
            .indexWhere((v) => v.id == entry.value?.assetEntityId),
        [entry, videos]);

    final pageController = usePageController(
      viewportFraction: 0.7,
      initialPage: initialIndex ?? 0,
      keys: [initialIndex],
    );

    final currentPage = useState(0.0);

    useEffect(() {
      if (initialIndex != null) {
        currentPage.value = initialIndex.toDouble();
      }
      return null;
    }, [initialIndex]);

    useEffect(() {
      pageController.addListener(() {
        if (pageController.positions.isNotEmpty &&
            pageController.page != null) {
          currentPage.value = pageController.page!;
        }
      });
      return null;
    }, [pageController]);

    useEffect(() {
      if (entry.value != null &&
          !(videos.value
                  ?.map((v) => v.id)
                  .contains(entry.value!.assetEntityId) ??
              true)) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          showEntryOriginalNotFoundDialog(context, ref);
        });
      }
      return null;
    }, [entry.value, videos.value]);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: !date.isToday() ? null : const RecordButton(),
      appBar: AppBar(
        actions: [
          if (entry.value != null)
            IconButton(
              onPressed: () async {
                if (await showDeleteEntryDialog(context, ref,
                    entry: entry.value!)) {
                  context.router.pop();
                }
              },
              icon: const Icon(Icons.delete_rounded),
              color: colorScheme.error,
            ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: colorScheme.background,
      body: videos.maybeWhen(
        data: (entities) => entities.isEmpty
            ? Center(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.videocam_off_rounded,
                    color: colorScheme.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Spacers.l),
                    child: Text(l10n.noVideos),
                  ),
                ],
              ))
            : Scrollbar(
                controller: pageController,
                child: PageView.builder(
                  controller: pageController,
                  reverse: Platform.isIOS,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) => TweenAnimationBuilder<double>(
                    tween: tween01,
                    duration: kThemeAnimationDuration,
                    builder: (context, value, child) => Opacity(
                      opacity: value,
                      child: child,
                    ),
                    child: VideoTile(
                      assetEntity: entities[i],
                      loadVideo: Platform.isAndroid
                          ? currentPage.value == i
                          : currentPage.value.round() == i,
                      distanceFromCenter: (currentPage.value - i).clamp(-1, 1),
                    ),
                  ),
                  itemCount: entities.length,
                ),
              ),
        orElse: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

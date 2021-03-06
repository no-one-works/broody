import 'dart:io';

import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/entry.providers.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/service/providers/video/video_gallery.providers.dart';
import 'package:broody/ui/shared/better_blob_clipper/better_blob_clipper.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/shared/providers/blob/blob.provider.dart';
import 'package:broody/ui/shared/providers/blob/request/blob_request.dart';
import 'package:broody/ui/shared/providers/color/color.providers.dart';
import 'package:broody/ui/shared/providers/color/request/color_scheme_request.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EntryWidget extends HookConsumerWidget {
  const EntryWidget({
    Key? key,
    required this.date,
    required this.showThumbnail,
  }) : super(key: key);

  final DateTime date;
  final bool showThumbnail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entry = ref.watch(entryForDateProvider(date)).value;
    final readOnly = ref.watch(selectedProjectReadOnlyProvider);
    final thumbnailFile =
        entry == null ? null : ref.watch(entryThumbnailProvider(entry)).value;
    final hasVideos = ref.watch(dayHasVideosProvider(date));
    final markVideos = hasVideos && entry == null;
    final themeColorScheme = useColorScheme();
    final colorScheme = entry == null
        ? themeColorScheme
        : ref.watch(
            colorSchemeProvider(
              ColorSchemeRequest.entry(
                entry: entry,
                projectColor: themeColorScheme.primary,
                brightness: themeColorScheme.brightness,
              ),
            ),
          );
    final textTheme = useTextTheme();
    final numberStyle = textTheme.button!.copyWith(
      color: colorScheme.secondary,
    );
    final blobData =
        ref.watch(blobProvider(BlobRequest(day: date.day, month: date.month)));
    return IgnorePointer(
      ignoring: showThumbnail,
      child: BouncyPressable(
        pressedScale: showThumbnail ? 1 : 0.8,
        onTap: () {
          if (showThumbnail) return;
          context.router.pushAll(
            [
              if (entry != null)
                EntryRoute(
                  entry: entry,
                  projectId: entry.projectId,
                  date: date,
                ),
              //TODO find out if we want this
              if (entry == null && !readOnly)
                VideoPickerRoute(
                  forDate: date,
                ),
            ],
          );
        },
        child: Stack(
          children: [
            Hero(
              tag: date,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 1, end: showThumbnail ? 8 : 1),
                curve: Curves.ease,
                duration: kThemeAnimationDuration * 3,
                builder: (context, value, child) => ClipPath(
                  clipper: BetterBlobClipper(
                    id: blobData,
                    scale: value,
                  ),
                  child: child,
                ),
                child: Stack(
                  children: [
                    Container(
                      color: colorScheme.secondaryContainer,
                      child: Center(
                        child: AnimatedOpacity(
                          duration: kThemeAnimationDuration * 2,
                          opacity:
                              !showThumbnail && markVideos && !readOnly ? 1 : 0,
                          child: Icon(
                            Icons.add_rounded,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    if (entry != null && thumbnailFile != null)
                      SizedBox.expand(
                        key: const ValueKey(true),
                        child: Image.file(
                          thumbnailFile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (entry != null)
                      AnimatedOpacity(
                        duration: kThemeAnimationDuration,
                        opacity: showThumbnail ? 0 : 1,
                        child: SizedBox.expand(
                          key: const ValueKey(false),
                          child: Image(
                            fit: BoxFit.fill,
                            image: BlurHashImage(entry.blurHash),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: AnimatedContainer(
                duration: kThemeAnimationDuration * 2,
                curve: Curves.ease,
                decoration: BoxDecoration(
                  color: (!markVideos || Platform.isIOS
                          ? themeColorScheme.background
                          : themeColorScheme.primary)
                      .withOpacity(showThumbnail ? 0.6 : 1),
                  shape: BoxShape.circle,
                ),
                margin: showThumbnail
                    ? const EdgeInsets.all(Spacers.xxs)
                    : const EdgeInsets.all(Spacers.s),
                padding: const EdgeInsets.all(Spacers.xxs),
                child: Text(date.day.toString().padLeft(2, '0'),
                    style: !markVideos || Platform.isIOS
                        ? numberStyle
                        : numberStyle.copyWith(color: colorScheme.onPrimary)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

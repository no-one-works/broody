import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

final fileVideoControllerProvider =
    FutureProvider.autoDispose.family((ref, String path) async {
  final file = File(path);
  debugPrint("Video Player Created: $path");
  final controller = VideoPlayerController.file(
    file,
    videoPlayerOptions: VideoPlayerOptions(
      mixWithOthers: true,
    ),
  );
  ref.onDispose(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.dispose();
      debugPrint("Video Player Disposed: $path");
    });
  });
  await controller.initialize();
  await Future.wait(
    [
      controller.setVolume(1),
      controller.play(),
    ],
  );
  return controller;
});

final loopingAssetVideoControllerProvider =
    FutureProvider.autoDispose.family((ref, String path) async {
  final controller = VideoPlayerController.asset(
    path,
    videoPlayerOptions: VideoPlayerOptions(
      mixWithOthers: true,
    ),
  );
  debugPrint("Video Player Created: $path");
  ref.onDispose(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.dispose();
      debugPrint("Video Player Disposed: $path");
    });
  });
  await controller.initialize();
  await Future.wait(
    [
      controller.setLooping(true),
      controller.setVolume(0),
      controller.play(),
    ],
  );
  return controller;
});

final loopingFileVideoControllerProvider =
    FutureProvider.autoDispose.family((ref, String path) async {
  final file = File(path);
  final controller = VideoPlayerController.file(
    file,
    videoPlayerOptions: VideoPlayerOptions(
      mixWithOthers: true,
    ),
  );
  debugPrint("Video Player Created: $path");
  ref.onDispose(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.dispose();
      debugPrint("Video Player Disposed: $path");
    });
  });
  await controller.initialize();
  await Future.wait(
    [
      controller.setLooping(true),
      controller.setVolume(0),
      controller.play(),
    ],
  );
  return controller;
});

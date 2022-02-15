import 'dart:async';
import 'dart:io';

import 'package:broody/ui/shared/providers/video/request/video_controller_request.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

final vlcVideoControllerProvider = FutureProvider.autoDispose
    .family((ref, VideoControllerRequest request) async {
  final controller = request.map(
    file: (r) => VlcPlayerController.file(
      File(r.path),
      autoPlay: request.autoPlay,
      options: VlcPlayerOptions(),
    ),
    asset: (r) => VlcPlayerController.asset(
      r.dataSource,
      autoPlay: request.autoPlay,
      options: VlcPlayerOptions(),
    ),
  );
  controller.addOnInitListener(() {
    //controller.setVolume((request.initialVolume * 100).round());
  });
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
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

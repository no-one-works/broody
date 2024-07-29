import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

class VideoPreviewPage extends HookConsumerWidget {
  const VideoPreviewPage({
    Key? key,
    required this.assetEntity,
  }) : super(key: key);

  final AssetEntity assetEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold();
  }
}

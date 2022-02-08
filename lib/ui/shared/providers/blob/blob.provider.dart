import 'dart:math';

import 'package:broody/core/constants/blob_params.dart';
import 'package:broody/ui/shared/providers/blob/request/blob_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final blobsProvider = Provider<List<String>>((ref) {
  int getRandomValue() {
    int maxRandomValue = ([99, 999, 9999, 99999, 999999]..shuffle()).first;
    return Random().nextInt(maxRandomValue);
  }

  return [
    for (int i = 0; i < 373; i++) "$edgesCount-$minGrowth-${getRandomValue()}"
  ];
});

final blobProvider = Provider.family((ref, BlobRequest request) {
  final blobs = ref.watch(blobsProvider);
  if (request.day.clamp(1, 31) == request.day &&
      request.month.clamp(1, 12) == request.month) {
    return blobs[request.month * request.day];
  } else {
    return blobs[0];
  }
});

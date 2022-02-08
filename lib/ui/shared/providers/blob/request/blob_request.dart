import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blob_request.freezed.dart';

@freezed
class BlobRequest with _$BlobRequest {
  const factory BlobRequest({
    required int day,
    required int month,
  }) = _BlobRequest;
}

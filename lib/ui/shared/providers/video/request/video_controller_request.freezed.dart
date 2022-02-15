// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_controller_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VideoControllerRequestTearOff {
  const _$VideoControllerRequestTearOff();

  FileVideoControllerRequest file(
      {required String path,
      bool looping = true,
      bool autoPlay = true,
      double initialVolume = 1}) {
    return FileVideoControllerRequest(
      path: path,
      looping: looping,
      autoPlay: autoPlay,
      initialVolume: initialVolume,
    );
  }

  AssetVideoControllerRequest asset(
      {required String dataSource,
      bool looping = true,
      bool autoPlay = true,
      double initialVolume = 1}) {
    return AssetVideoControllerRequest(
      dataSource: dataSource,
      looping: looping,
      autoPlay: autoPlay,
      initialVolume: initialVolume,
    );
  }
}

/// @nodoc
const $VideoControllerRequest = _$VideoControllerRequestTearOff();

/// @nodoc
mixin _$VideoControllerRequest {
  bool get looping => throw _privateConstructorUsedError;
  bool get autoPlay => throw _privateConstructorUsedError;
  double get initialVolume => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String path, bool looping, bool autoPlay, double initialVolume)
        file,
    required TResult Function(String dataSource, bool looping, bool autoPlay,
            double initialVolume)
        asset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String path, bool looping, bool autoPlay, double initialVolume)?
        file,
    TResult Function(String dataSource, bool looping, bool autoPlay,
            double initialVolume)?
        asset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String path, bool looping, bool autoPlay, double initialVolume)?
        file,
    TResult Function(String dataSource, bool looping, bool autoPlay,
            double initialVolume)?
        asset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileVideoControllerRequest value) file,
    required TResult Function(AssetVideoControllerRequest value) asset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FileVideoControllerRequest value)? file,
    TResult Function(AssetVideoControllerRequest value)? asset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileVideoControllerRequest value)? file,
    TResult Function(AssetVideoControllerRequest value)? asset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoControllerRequestCopyWith<VideoControllerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoControllerRequestCopyWith<$Res> {
  factory $VideoControllerRequestCopyWith(VideoControllerRequest value,
          $Res Function(VideoControllerRequest) then) =
      _$VideoControllerRequestCopyWithImpl<$Res>;
  $Res call({bool looping, bool autoPlay, double initialVolume});
}

/// @nodoc
class _$VideoControllerRequestCopyWithImpl<$Res>
    implements $VideoControllerRequestCopyWith<$Res> {
  _$VideoControllerRequestCopyWithImpl(this._value, this._then);

  final VideoControllerRequest _value;
  // ignore: unused_field
  final $Res Function(VideoControllerRequest) _then;

  @override
  $Res call({
    Object? looping = freezed,
    Object? autoPlay = freezed,
    Object? initialVolume = freezed,
  }) {
    return _then(_value.copyWith(
      looping: looping == freezed
          ? _value.looping
          : looping // ignore: cast_nullable_to_non_nullable
              as bool,
      autoPlay: autoPlay == freezed
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      initialVolume: initialVolume == freezed
          ? _value.initialVolume
          : initialVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class $FileVideoControllerRequestCopyWith<$Res>
    implements $VideoControllerRequestCopyWith<$Res> {
  factory $FileVideoControllerRequestCopyWith(FileVideoControllerRequest value,
          $Res Function(FileVideoControllerRequest) then) =
      _$FileVideoControllerRequestCopyWithImpl<$Res>;
  @override
  $Res call({String path, bool looping, bool autoPlay, double initialVolume});
}

/// @nodoc
class _$FileVideoControllerRequestCopyWithImpl<$Res>
    extends _$VideoControllerRequestCopyWithImpl<$Res>
    implements $FileVideoControllerRequestCopyWith<$Res> {
  _$FileVideoControllerRequestCopyWithImpl(FileVideoControllerRequest _value,
      $Res Function(FileVideoControllerRequest) _then)
      : super(_value, (v) => _then(v as FileVideoControllerRequest));

  @override
  FileVideoControllerRequest get _value =>
      super._value as FileVideoControllerRequest;

  @override
  $Res call({
    Object? path = freezed,
    Object? looping = freezed,
    Object? autoPlay = freezed,
    Object? initialVolume = freezed,
  }) {
    return _then(FileVideoControllerRequest(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      looping: looping == freezed
          ? _value.looping
          : looping // ignore: cast_nullable_to_non_nullable
              as bool,
      autoPlay: autoPlay == freezed
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      initialVolume: initialVolume == freezed
          ? _value.initialVolume
          : initialVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FileVideoControllerRequest implements FileVideoControllerRequest {
  const _$FileVideoControllerRequest(
      {required this.path,
      this.looping = true,
      this.autoPlay = true,
      this.initialVolume = 1});

  @override
  final String path;
  @JsonKey()
  @override
  final bool looping;
  @JsonKey()
  @override
  final bool autoPlay;
  @JsonKey()
  @override
  final double initialVolume;

  @override
  String toString() {
    return 'VideoControllerRequest.file(path: $path, looping: $looping, autoPlay: $autoPlay, initialVolume: $initialVolume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FileVideoControllerRequest &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.looping, looping) &&
            const DeepCollectionEquality().equals(other.autoPlay, autoPlay) &&
            const DeepCollectionEquality()
                .equals(other.initialVolume, initialVolume));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(looping),
      const DeepCollectionEquality().hash(autoPlay),
      const DeepCollectionEquality().hash(initialVolume));

  @JsonKey(ignore: true)
  @override
  $FileVideoControllerRequestCopyWith<FileVideoControllerRequest>
      get copyWith =>
          _$FileVideoControllerRequestCopyWithImpl<FileVideoControllerRequest>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String path, bool looping, bool autoPlay, double initialVolume)
        file,
    required TResult Function(String dataSource, bool looping, bool autoPlay,
            double initialVolume)
        asset,
  }) {
    return file(path, looping, autoPlay, initialVolume);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String path, bool looping, bool autoPlay, double initialVolume)?
        file,
    TResult Function(String dataSource, bool looping, bool autoPlay,
            double initialVolume)?
        asset,
  }) {
    return file?.call(path, looping, autoPlay, initialVolume);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String path, bool looping, bool autoPlay, double initialVolume)?
        file,
    TResult Function(String dataSource, bool looping, bool autoPlay,
            double initialVolume)?
        asset,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(path, looping, autoPlay, initialVolume);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileVideoControllerRequest value) file,
    required TResult Function(AssetVideoControllerRequest value) asset,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FileVideoControllerRequest value)? file,
    TResult Function(AssetVideoControllerRequest value)? asset,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileVideoControllerRequest value)? file,
    TResult Function(AssetVideoControllerRequest value)? asset,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }
}

abstract class FileVideoControllerRequest implements VideoControllerRequest {
  const factory FileVideoControllerRequest(
      {required String path,
      bool looping,
      bool autoPlay,
      double initialVolume}) = _$FileVideoControllerRequest;

  String get path;
  @override
  bool get looping;
  @override
  bool get autoPlay;
  @override
  double get initialVolume;
  @override
  @JsonKey(ignore: true)
  $FileVideoControllerRequestCopyWith<FileVideoControllerRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetVideoControllerRequestCopyWith<$Res>
    implements $VideoControllerRequestCopyWith<$Res> {
  factory $AssetVideoControllerRequestCopyWith(
          AssetVideoControllerRequest value,
          $Res Function(AssetVideoControllerRequest) then) =
      _$AssetVideoControllerRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String dataSource, bool looping, bool autoPlay, double initialVolume});
}

/// @nodoc
class _$AssetVideoControllerRequestCopyWithImpl<$Res>
    extends _$VideoControllerRequestCopyWithImpl<$Res>
    implements $AssetVideoControllerRequestCopyWith<$Res> {
  _$AssetVideoControllerRequestCopyWithImpl(AssetVideoControllerRequest _value,
      $Res Function(AssetVideoControllerRequest) _then)
      : super(_value, (v) => _then(v as AssetVideoControllerRequest));

  @override
  AssetVideoControllerRequest get _value =>
      super._value as AssetVideoControllerRequest;

  @override
  $Res call({
    Object? dataSource = freezed,
    Object? looping = freezed,
    Object? autoPlay = freezed,
    Object? initialVolume = freezed,
  }) {
    return _then(AssetVideoControllerRequest(
      dataSource: dataSource == freezed
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String,
      looping: looping == freezed
          ? _value.looping
          : looping // ignore: cast_nullable_to_non_nullable
              as bool,
      autoPlay: autoPlay == freezed
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      initialVolume: initialVolume == freezed
          ? _value.initialVolume
          : initialVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AssetVideoControllerRequest implements AssetVideoControllerRequest {
  const _$AssetVideoControllerRequest(
      {required this.dataSource,
      this.looping = true,
      this.autoPlay = true,
      this.initialVolume = 1});

  @override
  final String dataSource;
  @JsonKey()
  @override
  final bool looping;
  @JsonKey()
  @override
  final bool autoPlay;
  @JsonKey()
  @override
  final double initialVolume;

  @override
  String toString() {
    return 'VideoControllerRequest.asset(dataSource: $dataSource, looping: $looping, autoPlay: $autoPlay, initialVolume: $initialVolume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetVideoControllerRequest &&
            const DeepCollectionEquality()
                .equals(other.dataSource, dataSource) &&
            const DeepCollectionEquality().equals(other.looping, looping) &&
            const DeepCollectionEquality().equals(other.autoPlay, autoPlay) &&
            const DeepCollectionEquality()
                .equals(other.initialVolume, initialVolume));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dataSource),
      const DeepCollectionEquality().hash(looping),
      const DeepCollectionEquality().hash(autoPlay),
      const DeepCollectionEquality().hash(initialVolume));

  @JsonKey(ignore: true)
  @override
  $AssetVideoControllerRequestCopyWith<AssetVideoControllerRequest>
      get copyWith => _$AssetVideoControllerRequestCopyWithImpl<
          AssetVideoControllerRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String path, bool looping, bool autoPlay, double initialVolume)
        file,
    required TResult Function(String dataSource, bool looping, bool autoPlay,
            double initialVolume)
        asset,
  }) {
    return asset(dataSource, looping, autoPlay, initialVolume);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String path, bool looping, bool autoPlay, double initialVolume)?
        file,
    TResult Function(String dataSource, bool looping, bool autoPlay,
            double initialVolume)?
        asset,
  }) {
    return asset?.call(dataSource, looping, autoPlay, initialVolume);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String path, bool looping, bool autoPlay, double initialVolume)?
        file,
    TResult Function(String dataSource, bool looping, bool autoPlay,
            double initialVolume)?
        asset,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(dataSource, looping, autoPlay, initialVolume);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileVideoControllerRequest value) file,
    required TResult Function(AssetVideoControllerRequest value) asset,
  }) {
    return asset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FileVideoControllerRequest value)? file,
    TResult Function(AssetVideoControllerRequest value)? asset,
  }) {
    return asset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileVideoControllerRequest value)? file,
    TResult Function(AssetVideoControllerRequest value)? asset,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(this);
    }
    return orElse();
  }
}

abstract class AssetVideoControllerRequest implements VideoControllerRequest {
  const factory AssetVideoControllerRequest(
      {required String dataSource,
      bool looping,
      bool autoPlay,
      double initialVolume}) = _$AssetVideoControllerRequest;

  String get dataSource;
  @override
  bool get looping;
  @override
  bool get autoPlay;
  @override
  double get initialVolume;
  @override
  @JsonKey(ignore: true)
  $AssetVideoControllerRequestCopyWith<AssetVideoControllerRequest>
      get copyWith => throw _privateConstructorUsedError;
}

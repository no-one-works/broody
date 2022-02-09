// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'compilation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Compilation _$CompilationFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'create':
      return CreateCompilation.fromJson(json);
    case 'saved':
      return SavedCompilation.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Compilation',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$CompilationTearOff {
  const _$CompilationTearOff();

  CreateCompilation create(
      {required String uid,
      required String projectUid,
      required String projectTitle,
      int? month,
      required String destination,
      required List<SavedEntry> usedEntries,
      required double width,
      required double height,
      required String projectPath,
      required DateTime created}) {
    return CreateCompilation(
      uid: uid,
      projectUid: projectUid,
      projectTitle: projectTitle,
      month: month,
      destination: destination,
      usedEntries: usedEntries,
      width: width,
      height: height,
      projectPath: projectPath,
      created: created,
    );
  }

  SavedCompilation saved(
      {required String uid,
      required String filename,
      required String projectUid,
      int? month,
      required List<SavedEntry> usedEntries,
      required double width,
      required double height,
      int algorithmVersion = compilationAlgorithmVersion,
      required DateTime created}) {
    return SavedCompilation(
      uid: uid,
      filename: filename,
      projectUid: projectUid,
      month: month,
      usedEntries: usedEntries,
      width: width,
      height: height,
      algorithmVersion: algorithmVersion,
      created: created,
    );
  }

  Compilation fromJson(Map<String, Object?> json) {
    return Compilation.fromJson(json);
  }
}

/// @nodoc
const $Compilation = _$CompilationTearOff();

/// @nodoc
mixin _$Compilation {
  String get uid => throw _privateConstructorUsedError;
  String get projectUid => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;
  List<SavedEntry> get usedEntries => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uid,
            String projectUid,
            String projectTitle,
            int? month,
            String destination,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            String projectPath,
            DateTime created)
        create,
    required TResult Function(
            String uid,
            String filename,
            String projectUid,
            int? month,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            int algorithmVersion,
            DateTime created)
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String uid,
            String projectUid,
            String projectTitle,
            int? month,
            String destination,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            String projectPath,
            DateTime created)?
        create,
    TResult Function(
            String uid,
            String filename,
            String projectUid,
            int? month,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            int algorithmVersion,
            DateTime created)?
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uid,
            String projectUid,
            String projectTitle,
            int? month,
            String destination,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            String projectPath,
            DateTime created)?
        create,
    TResult Function(
            String uid,
            String filename,
            String projectUid,
            int? month,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            int algorithmVersion,
            DateTime created)?
        saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateCompilation value) create,
    required TResult Function(SavedCompilation value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateCompilation value)? create,
    TResult Function(SavedCompilation value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateCompilation value)? create,
    TResult Function(SavedCompilation value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompilationCopyWith<Compilation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompilationCopyWith<$Res> {
  factory $CompilationCopyWith(
          Compilation value, $Res Function(Compilation) then) =
      _$CompilationCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String projectUid,
      int? month,
      List<SavedEntry> usedEntries,
      double width,
      double height,
      DateTime created});
}

/// @nodoc
class _$CompilationCopyWithImpl<$Res> implements $CompilationCopyWith<$Res> {
  _$CompilationCopyWithImpl(this._value, this._then);

  final Compilation _value;
  // ignore: unused_field
  final $Res Function(Compilation) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? projectUid = freezed,
    Object? month = freezed,
    Object? usedEntries = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      projectUid: projectUid == freezed
          ? _value.projectUid
          : projectUid // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      usedEntries: usedEntries == freezed
          ? _value.usedEntries
          : usedEntries // ignore: cast_nullable_to_non_nullable
              as List<SavedEntry>,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class $CreateCompilationCopyWith<$Res>
    implements $CompilationCopyWith<$Res> {
  factory $CreateCompilationCopyWith(
          CreateCompilation value, $Res Function(CreateCompilation) then) =
      _$CreateCompilationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String projectUid,
      String projectTitle,
      int? month,
      String destination,
      List<SavedEntry> usedEntries,
      double width,
      double height,
      String projectPath,
      DateTime created});
}

/// @nodoc
class _$CreateCompilationCopyWithImpl<$Res>
    extends _$CompilationCopyWithImpl<$Res>
    implements $CreateCompilationCopyWith<$Res> {
  _$CreateCompilationCopyWithImpl(
      CreateCompilation _value, $Res Function(CreateCompilation) _then)
      : super(_value, (v) => _then(v as CreateCompilation));

  @override
  CreateCompilation get _value => super._value as CreateCompilation;

  @override
  $Res call({
    Object? uid = freezed,
    Object? projectUid = freezed,
    Object? projectTitle = freezed,
    Object? month = freezed,
    Object? destination = freezed,
    Object? usedEntries = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? projectPath = freezed,
    Object? created = freezed,
  }) {
    return _then(CreateCompilation(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      projectUid: projectUid == freezed
          ? _value.projectUid
          : projectUid // ignore: cast_nullable_to_non_nullable
              as String,
      projectTitle: projectTitle == freezed
          ? _value.projectTitle
          : projectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      destination: destination == freezed
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      usedEntries: usedEntries == freezed
          ? _value.usedEntries
          : usedEntries // ignore: cast_nullable_to_non_nullable
              as List<SavedEntry>,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      projectPath: projectPath == freezed
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCompilation implements CreateCompilation {
  const _$CreateCompilation(
      {required this.uid,
      required this.projectUid,
      required this.projectTitle,
      this.month,
      required this.destination,
      required this.usedEntries,
      required this.width,
      required this.height,
      required this.projectPath,
      required this.created,
      String? $type})
      : $type = $type ?? 'create';

  factory _$CreateCompilation.fromJson(Map<String, dynamic> json) =>
      _$$CreateCompilationFromJson(json);

  @override
  final String uid;
  @override
  final String projectUid;
  @override
  final String projectTitle;
  @override
  final int? month;
  @override
  final String destination;
  @override
  final List<SavedEntry> usedEntries;
  @override
  final double width;
  @override
  final double height;
  @override
  final String projectPath;
  @override
  final DateTime created;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Compilation.create(uid: $uid, projectUid: $projectUid, projectTitle: $projectTitle, month: $month, destination: $destination, usedEntries: $usedEntries, width: $width, height: $height, projectPath: $projectPath, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCompilation &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.projectUid, projectUid) &&
            const DeepCollectionEquality()
                .equals(other.projectTitle, projectTitle) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality()
                .equals(other.destination, destination) &&
            const DeepCollectionEquality()
                .equals(other.usedEntries, usedEntries) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality()
                .equals(other.projectPath, projectPath) &&
            const DeepCollectionEquality().equals(other.created, created));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(projectUid),
      const DeepCollectionEquality().hash(projectTitle),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(destination),
      const DeepCollectionEquality().hash(usedEntries),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(projectPath),
      const DeepCollectionEquality().hash(created));

  @JsonKey(ignore: true)
  @override
  $CreateCompilationCopyWith<CreateCompilation> get copyWith =>
      _$CreateCompilationCopyWithImpl<CreateCompilation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uid,
            String projectUid,
            String projectTitle,
            int? month,
            String destination,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            String projectPath,
            DateTime created)
        create,
    required TResult Function(
            String uid,
            String filename,
            String projectUid,
            int? month,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            int algorithmVersion,
            DateTime created)
        saved,
  }) {
    return create(uid, projectUid, projectTitle, month, destination,
        usedEntries, width, height, projectPath, created);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String uid,
            String projectUid,
            String projectTitle,
            int? month,
            String destination,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            String projectPath,
            DateTime created)?
        create,
    TResult Function(
            String uid,
            String filename,
            String projectUid,
            int? month,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            int algorithmVersion,
            DateTime created)?
        saved,
  }) {
    return create?.call(uid, projectUid, projectTitle, month, destination,
        usedEntries, width, height, projectPath, created);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uid,
            String projectUid,
            String projectTitle,
            int? month,
            String destination,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            String projectPath,
            DateTime created)?
        create,
    TResult Function(
            String uid,
            String filename,
            String projectUid,
            int? month,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            int algorithmVersion,
            DateTime created)?
        saved,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(uid, projectUid, projectTitle, month, destination,
          usedEntries, width, height, projectPath, created);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateCompilation value) create,
    required TResult Function(SavedCompilation value) saved,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateCompilation value)? create,
    TResult Function(SavedCompilation value)? saved,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateCompilation value)? create,
    TResult Function(SavedCompilation value)? saved,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCompilationToJson(this);
  }
}

abstract class CreateCompilation implements Compilation {
  const factory CreateCompilation(
      {required String uid,
      required String projectUid,
      required String projectTitle,
      int? month,
      required String destination,
      required List<SavedEntry> usedEntries,
      required double width,
      required double height,
      required String projectPath,
      required DateTime created}) = _$CreateCompilation;

  factory CreateCompilation.fromJson(Map<String, dynamic> json) =
      _$CreateCompilation.fromJson;

  @override
  String get uid;
  @override
  String get projectUid;
  String get projectTitle;
  @override
  int? get month;
  String get destination;
  @override
  List<SavedEntry> get usedEntries;
  @override
  double get width;
  @override
  double get height;
  String get projectPath;
  @override
  DateTime get created;
  @override
  @JsonKey(ignore: true)
  $CreateCompilationCopyWith<CreateCompilation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedCompilationCopyWith<$Res>
    implements $CompilationCopyWith<$Res> {
  factory $SavedCompilationCopyWith(
          SavedCompilation value, $Res Function(SavedCompilation) then) =
      _$SavedCompilationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String filename,
      String projectUid,
      int? month,
      List<SavedEntry> usedEntries,
      double width,
      double height,
      int algorithmVersion,
      DateTime created});
}

/// @nodoc
class _$SavedCompilationCopyWithImpl<$Res>
    extends _$CompilationCopyWithImpl<$Res>
    implements $SavedCompilationCopyWith<$Res> {
  _$SavedCompilationCopyWithImpl(
      SavedCompilation _value, $Res Function(SavedCompilation) _then)
      : super(_value, (v) => _then(v as SavedCompilation));

  @override
  SavedCompilation get _value => super._value as SavedCompilation;

  @override
  $Res call({
    Object? uid = freezed,
    Object? filename = freezed,
    Object? projectUid = freezed,
    Object? month = freezed,
    Object? usedEntries = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? algorithmVersion = freezed,
    Object? created = freezed,
  }) {
    return _then(SavedCompilation(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      projectUid: projectUid == freezed
          ? _value.projectUid
          : projectUid // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      usedEntries: usedEntries == freezed
          ? _value.usedEntries
          : usedEntries // ignore: cast_nullable_to_non_nullable
              as List<SavedEntry>,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      algorithmVersion: algorithmVersion == freezed
          ? _value.algorithmVersion
          : algorithmVersion // ignore: cast_nullable_to_non_nullable
              as int,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedCompilation implements SavedCompilation {
  const _$SavedCompilation(
      {required this.uid,
      required this.filename,
      required this.projectUid,
      this.month,
      required this.usedEntries,
      required this.width,
      required this.height,
      this.algorithmVersion = compilationAlgorithmVersion,
      required this.created,
      String? $type})
      : $type = $type ?? 'saved';

  factory _$SavedCompilation.fromJson(Map<String, dynamic> json) =>
      _$$SavedCompilationFromJson(json);

  @override
  final String uid;
  @override
  final String filename;
  @override
  final String projectUid;
  @override
  final int? month;
  @override
  final List<SavedEntry> usedEntries;
  @override
  final double width;
  @override
  final double height;
  @JsonKey()
  @override
  final int algorithmVersion;
  @override
  final DateTime created;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Compilation.saved(uid: $uid, filename: $filename, projectUid: $projectUid, month: $month, usedEntries: $usedEntries, width: $width, height: $height, algorithmVersion: $algorithmVersion, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedCompilation &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.filename, filename) &&
            const DeepCollectionEquality()
                .equals(other.projectUid, projectUid) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality()
                .equals(other.usedEntries, usedEntries) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality()
                .equals(other.algorithmVersion, algorithmVersion) &&
            const DeepCollectionEquality().equals(other.created, created));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(filename),
      const DeepCollectionEquality().hash(projectUid),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(usedEntries),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(algorithmVersion),
      const DeepCollectionEquality().hash(created));

  @JsonKey(ignore: true)
  @override
  $SavedCompilationCopyWith<SavedCompilation> get copyWith =>
      _$SavedCompilationCopyWithImpl<SavedCompilation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uid,
            String projectUid,
            String projectTitle,
            int? month,
            String destination,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            String projectPath,
            DateTime created)
        create,
    required TResult Function(
            String uid,
            String filename,
            String projectUid,
            int? month,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            int algorithmVersion,
            DateTime created)
        saved,
  }) {
    return saved(uid, filename, projectUid, month, usedEntries, width, height,
        algorithmVersion, created);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String uid,
            String projectUid,
            String projectTitle,
            int? month,
            String destination,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            String projectPath,
            DateTime created)?
        create,
    TResult Function(
            String uid,
            String filename,
            String projectUid,
            int? month,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            int algorithmVersion,
            DateTime created)?
        saved,
  }) {
    return saved?.call(uid, filename, projectUid, month, usedEntries, width,
        height, algorithmVersion, created);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uid,
            String projectUid,
            String projectTitle,
            int? month,
            String destination,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            String projectPath,
            DateTime created)?
        create,
    TResult Function(
            String uid,
            String filename,
            String projectUid,
            int? month,
            List<SavedEntry> usedEntries,
            double width,
            double height,
            int algorithmVersion,
            DateTime created)?
        saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(uid, filename, projectUid, month, usedEntries, width, height,
          algorithmVersion, created);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateCompilation value) create,
    required TResult Function(SavedCompilation value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateCompilation value)? create,
    TResult Function(SavedCompilation value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateCompilation value)? create,
    TResult Function(SavedCompilation value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedCompilationToJson(this);
  }
}

abstract class SavedCompilation implements Compilation {
  const factory SavedCompilation(
      {required String uid,
      required String filename,
      required String projectUid,
      int? month,
      required List<SavedEntry> usedEntries,
      required double width,
      required double height,
      int algorithmVersion,
      required DateTime created}) = _$SavedCompilation;

  factory SavedCompilation.fromJson(Map<String, dynamic> json) =
      _$SavedCompilation.fromJson;

  @override
  String get uid;
  String get filename;
  @override
  String get projectUid;
  @override
  int? get month;
  @override
  List<SavedEntry> get usedEntries;
  @override
  double get width;
  @override
  double get height;
  int get algorithmVersion;
  @override
  DateTime get created;
  @override
  @JsonKey(ignore: true)
  $SavedCompilationCopyWith<SavedCompilation> get copyWith =>
      throw _privateConstructorUsedError;
}

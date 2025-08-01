// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Recording _$RecordingFromJson(Map<String, dynamic> json) {
  return _Recording.fromJson(json);
}

/// @nodoc
mixin _$Recording {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get audioUrl => throw _privateConstructorUsedError;
  Processing get processed => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Profile get employee => throw _privateConstructorUsedError;

  /// Create a copy of Recording
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordingCopyWith<Recording> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingCopyWith<$Res> {
  factory $RecordingCopyWith(Recording value, $Res Function(Recording) then) =
      _$RecordingCopyWithImpl<$Res, Recording>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'url') String audioUrl,
    Processing processed,
    DateTime createdAt,
    Profile employee,
  });

  $ProfileCopyWith<$Res> get employee;
}

/// @nodoc
class _$RecordingCopyWithImpl<$Res, $Val extends Recording>
    implements $RecordingCopyWith<$Res> {
  _$RecordingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recording
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? audioUrl = null,
    Object? processed = null,
    Object? createdAt = null,
    Object? employee = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            audioUrl:
                null == audioUrl
                    ? _value.audioUrl
                    : audioUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            processed:
                null == processed
                    ? _value.processed
                    : processed // ignore: cast_nullable_to_non_nullable
                        as Processing,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            employee:
                null == employee
                    ? _value.employee
                    : employee // ignore: cast_nullable_to_non_nullable
                        as Profile,
          )
          as $Val,
    );
  }

  /// Create a copy of Recording
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get employee {
    return $ProfileCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecordingImplCopyWith<$Res>
    implements $RecordingCopyWith<$Res> {
  factory _$$RecordingImplCopyWith(
    _$RecordingImpl value,
    $Res Function(_$RecordingImpl) then,
  ) = __$$RecordingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'url') String audioUrl,
    Processing processed,
    DateTime createdAt,
    Profile employee,
  });

  @override
  $ProfileCopyWith<$Res> get employee;
}

/// @nodoc
class __$$RecordingImplCopyWithImpl<$Res>
    extends _$RecordingCopyWithImpl<$Res, _$RecordingImpl>
    implements _$$RecordingImplCopyWith<$Res> {
  __$$RecordingImplCopyWithImpl(
    _$RecordingImpl _value,
    $Res Function(_$RecordingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Recording
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? audioUrl = null,
    Object? processed = null,
    Object? createdAt = null,
    Object? employee = null,
  }) {
    return _then(
      _$RecordingImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        audioUrl:
            null == audioUrl
                ? _value.audioUrl
                : audioUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        processed:
            null == processed
                ? _value.processed
                : processed // ignore: cast_nullable_to_non_nullable
                    as Processing,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        employee:
            null == employee
                ? _value.employee
                : employee // ignore: cast_nullable_to_non_nullable
                    as Profile,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$RecordingImpl implements _Recording {
  const _$RecordingImpl({
    required this.id,
    @JsonKey(name: 'url') required this.audioUrl,
    required this.processed,
    required this.createdAt,
    required this.employee,
  });

  factory _$RecordingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordingImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'url')
  final String audioUrl;
  @override
  final Processing processed;
  @override
  final DateTime createdAt;
  @override
  final Profile employee;

  @override
  String toString() {
    return 'Recording(id: $id, audioUrl: $audioUrl, processed: $processed, createdAt: $createdAt, employee: $employee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.processed, processed) ||
                other.processed == processed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.employee, employee) ||
                other.employee == employee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, audioUrl, processed, createdAt, employee);

  /// Create a copy of Recording
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingImplCopyWith<_$RecordingImpl> get copyWith =>
      __$$RecordingImplCopyWithImpl<_$RecordingImpl>(this, _$identity);
}

abstract class _Recording implements Recording {
  const factory _Recording({
    required final int id,
    @JsonKey(name: 'url') required final String audioUrl,
    required final Processing processed,
    required final DateTime createdAt,
    required final Profile employee,
  }) = _$RecordingImpl;

  factory _Recording.fromJson(Map<String, dynamic> json) =
      _$RecordingImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'url')
  String get audioUrl;
  @override
  Processing get processed;
  @override
  DateTime get createdAt;
  @override
  Profile get employee;

  /// Create a copy of Recording
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingImplCopyWith<_$RecordingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

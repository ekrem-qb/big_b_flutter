// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planned_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlannedTask _$PlannedTaskFromJson(Map<String, dynamic> json) {
  return _PlannedTask.fromJson(json);
}

/// @nodoc
mixin _$PlannedTask {
  @JsonKey(includeToJson: false)
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  bool get isImageRequired => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get weekdays =>
      throw _privateConstructorUsedError; // ignore: always_put_required_named_parameters_first
  @JsonKey(includeToJson: false)
  List<Profile> get executives => throw _privateConstructorUsedError;

  /// Serializes this PlannedTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlannedTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannedTaskCopyWith<PlannedTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannedTaskCopyWith<$Res> {
  factory $PlannedTaskCopyWith(
          PlannedTask value, $Res Function(PlannedTask) then) =
      _$PlannedTaskCopyWithImpl<$Res, PlannedTask>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      String text,
      DateTime deadline,
      bool isImageRequired,
      DateTime updatedAt,
      int weekdays,
      @JsonKey(includeToJson: false) List<Profile> executives});
}

/// @nodoc
class _$PlannedTaskCopyWithImpl<$Res, $Val extends PlannedTask>
    implements $PlannedTaskCopyWith<$Res> {
  _$PlannedTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannedTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? deadline = null,
    Object? isImageRequired = null,
    Object? updatedAt = null,
    Object? weekdays = null,
    Object? executives = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isImageRequired: null == isImageRequired
          ? _value.isImageRequired
          : isImageRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekdays: null == weekdays
          ? _value.weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as int,
      executives: null == executives
          ? _value.executives
          : executives // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannedTaskImplCopyWith<$Res>
    implements $PlannedTaskCopyWith<$Res> {
  factory _$$PlannedTaskImplCopyWith(
          _$PlannedTaskImpl value, $Res Function(_$PlannedTaskImpl) then) =
      __$$PlannedTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      String text,
      DateTime deadline,
      bool isImageRequired,
      DateTime updatedAt,
      int weekdays,
      @JsonKey(includeToJson: false) List<Profile> executives});
}

/// @nodoc
class __$$PlannedTaskImplCopyWithImpl<$Res>
    extends _$PlannedTaskCopyWithImpl<$Res, _$PlannedTaskImpl>
    implements _$$PlannedTaskImplCopyWith<$Res> {
  __$$PlannedTaskImplCopyWithImpl(
      _$PlannedTaskImpl _value, $Res Function(_$PlannedTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannedTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? deadline = null,
    Object? isImageRequired = null,
    Object? updatedAt = null,
    Object? weekdays = null,
    Object? executives = null,
  }) {
    return _then(_$PlannedTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isImageRequired: null == isImageRequired
          ? _value.isImageRequired
          : isImageRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekdays: null == weekdays
          ? _value.weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as int,
      executives: null == executives
          ? _value._executives
          : executives // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannedTaskImpl implements _PlannedTask {
  const _$PlannedTaskImpl(
      {@JsonKey(includeToJson: false) required this.id,
      required this.text,
      required this.deadline,
      required this.isImageRequired,
      required this.updatedAt,
      required this.weekdays,
      @JsonKey(includeToJson: false) required final List<Profile> executives})
      : _executives = executives;

  factory _$PlannedTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannedTaskImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int id;
  @override
  final String text;
  @override
  final DateTime deadline;
  @override
  final bool isImageRequired;
  @override
  final DateTime updatedAt;
  @override
  final int weekdays;
// ignore: always_put_required_named_parameters_first
  final List<Profile> _executives;
// ignore: always_put_required_named_parameters_first
  @override
  @JsonKey(includeToJson: false)
  List<Profile> get executives {
    if (_executives is EqualUnmodifiableListView) return _executives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_executives);
  }

  @override
  String toString() {
    return 'PlannedTask(id: $id, text: $text, deadline: $deadline, isImageRequired: $isImageRequired, updatedAt: $updatedAt, weekdays: $weekdays, executives: $executives)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannedTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.isImageRequired, isImageRequired) ||
                other.isImageRequired == isImageRequired) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.weekdays, weekdays) ||
                other.weekdays == weekdays) &&
            const DeepCollectionEquality()
                .equals(other._executives, _executives));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      deadline,
      isImageRequired,
      updatedAt,
      weekdays,
      const DeepCollectionEquality().hash(_executives));

  /// Create a copy of PlannedTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannedTaskImplCopyWith<_$PlannedTaskImpl> get copyWith =>
      __$$PlannedTaskImplCopyWithImpl<_$PlannedTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannedTaskImplToJson(
      this,
    );
  }
}

abstract class _PlannedTask implements PlannedTask {
  const factory _PlannedTask(
      {@JsonKey(includeToJson: false) required final int id,
      required final String text,
      required final DateTime deadline,
      required final bool isImageRequired,
      required final DateTime updatedAt,
      required final int weekdays,
      @JsonKey(includeToJson: false)
      required final List<Profile> executives}) = _$PlannedTaskImpl;

  factory _PlannedTask.fromJson(Map<String, dynamic> json) =
      _$PlannedTaskImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int get id;
  @override
  String get text;
  @override
  DateTime get deadline;
  @override
  bool get isImageRequired;
  @override
  DateTime get updatedAt;
  @override
  int get weekdays; // ignore: always_put_required_named_parameters_first
  @override
  @JsonKey(includeToJson: false)
  List<Profile> get executives;

  /// Create a copy of PlannedTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannedTaskImplCopyWith<_$PlannedTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

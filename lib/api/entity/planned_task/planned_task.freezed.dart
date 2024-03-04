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
  @JsonKey(defaultValue: -1, includeToJson: false)
  int get id => throw _privateConstructorUsedError;
  Task get task => throw _privateConstructorUsedError;
  Duration get time => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<bool> get weekdays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {@JsonKey(defaultValue: -1, includeToJson: false) int id,
      Task task,
      Duration time,
      DateTime updatedAt,
      List<bool> weekdays});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class _$PlannedTaskCopyWithImpl<$Res, $Val extends PlannedTask>
    implements $PlannedTaskCopyWith<$Res> {
  _$PlannedTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? task = null,
    Object? time = null,
    Object? updatedAt = null,
    Object? weekdays = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekdays: null == weekdays
          ? _value.weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
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
      {@JsonKey(defaultValue: -1, includeToJson: false) int id,
      Task task,
      Duration time,
      DateTime updatedAt,
      List<bool> weekdays});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$PlannedTaskImplCopyWithImpl<$Res>
    extends _$PlannedTaskCopyWithImpl<$Res, _$PlannedTaskImpl>
    implements _$$PlannedTaskImplCopyWith<$Res> {
  __$$PlannedTaskImplCopyWithImpl(
      _$PlannedTaskImpl _value, $Res Function(_$PlannedTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? task = null,
    Object? time = null,
    Object? updatedAt = null,
    Object? weekdays = null,
  }) {
    return _then(_$PlannedTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekdays: null == weekdays
          ? _value._weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannedTaskImpl implements _PlannedTask {
  const _$PlannedTaskImpl(
      {@JsonKey(defaultValue: -1, includeToJson: false) required this.id,
      required this.task,
      required this.time,
      required this.updatedAt,
      required final List<bool> weekdays})
      : _weekdays = weekdays;

  factory _$PlannedTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannedTaskImplFromJson(json);

  @override
  @JsonKey(defaultValue: -1, includeToJson: false)
  final int id;
  @override
  final Task task;
  @override
  final Duration time;
  @override
  final DateTime updatedAt;
  final List<bool> _weekdays;
  @override
  List<bool> get weekdays {
    if (_weekdays is EqualUnmodifiableListView) return _weekdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdays);
  }

  @override
  String toString() {
    return 'PlannedTask(id: $id, task: $task, time: $time, updatedAt: $updatedAt, weekdays: $weekdays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannedTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._weekdays, _weekdays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, task, time, updatedAt,
      const DeepCollectionEquality().hash(_weekdays));

  @JsonKey(ignore: true)
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
      {@JsonKey(defaultValue: -1, includeToJson: false) required final int id,
      required final Task task,
      required final Duration time,
      required final DateTime updatedAt,
      required final List<bool> weekdays}) = _$PlannedTaskImpl;

  factory _PlannedTask.fromJson(Map<String, dynamic> json) =
      _$PlannedTaskImpl.fromJson;

  @override
  @JsonKey(defaultValue: -1, includeToJson: false)
  int get id;
  @override
  Task get task;
  @override
  Duration get time;
  @override
  DateTime get updatedAt;
  @override
  List<bool> get weekdays;
  @override
  @JsonKey(ignore: true)
  _$$PlannedTaskImplCopyWith<_$PlannedTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

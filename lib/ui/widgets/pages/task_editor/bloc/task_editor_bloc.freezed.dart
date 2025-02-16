// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskEditorEvent {}

/// @nodoc
abstract class $TaskEditorEventCopyWith<$Res> {
  factory $TaskEditorEventCopyWith(
    TaskEditorEvent value,
    $Res Function(TaskEditorEvent) then,
  ) = _$TaskEditorEventCopyWithImpl<$Res, TaskEditorEvent>;
}

/// @nodoc
class _$TaskEditorEventCopyWithImpl<$Res, $Val extends TaskEditorEvent>
    implements $TaskEditorEventCopyWith<$Res> {
  _$TaskEditorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskEditorEventLoadRequestedImplCopyWith<$Res> {
  factory _$$TaskEditorEventLoadRequestedImplCopyWith(
    _$TaskEditorEventLoadRequestedImpl value,
    $Res Function(_$TaskEditorEventLoadRequestedImpl) then,
  ) = __$$TaskEditorEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskEditorEventLoadRequestedImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<$Res, _$TaskEditorEventLoadRequestedImpl>
    implements _$$TaskEditorEventLoadRequestedImplCopyWith<$Res> {
  __$$TaskEditorEventLoadRequestedImplCopyWithImpl(
    _$TaskEditorEventLoadRequestedImpl _value,
    $Res Function(_$TaskEditorEventLoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskEditorEventLoadRequestedImpl
    implements TaskEditorEventLoadRequested {
  const _$TaskEditorEventLoadRequestedImpl();

  @override
  String toString() {
    return 'TaskEditorEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class TaskEditorEventLoadRequested implements TaskEditorEvent {
  const factory TaskEditorEventLoadRequested() =
      _$TaskEditorEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$TaskEditorEventTextChangedImplCopyWith<$Res> {
  factory _$$TaskEditorEventTextChangedImplCopyWith(
    _$TaskEditorEventTextChangedImpl value,
    $Res Function(_$TaskEditorEventTextChangedImpl) then,
  ) = __$$TaskEditorEventTextChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$TaskEditorEventTextChangedImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<$Res, _$TaskEditorEventTextChangedImpl>
    implements _$$TaskEditorEventTextChangedImplCopyWith<$Res> {
  __$$TaskEditorEventTextChangedImplCopyWithImpl(
    _$TaskEditorEventTextChangedImpl _value,
    $Res Function(_$TaskEditorEventTextChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null}) {
    return _then(
      _$TaskEditorEventTextChangedImpl(
        null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$TaskEditorEventTextChangedImpl implements TaskEditorEventTextChanged {
  const _$TaskEditorEventTextChangedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'TaskEditorEvent.textChanged(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventTextChangedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEditorEventTextChangedImplCopyWith<_$TaskEditorEventTextChangedImpl>
  get copyWith => __$$TaskEditorEventTextChangedImplCopyWithImpl<
    _$TaskEditorEventTextChangedImpl
  >(this, _$identity);
}

abstract class TaskEditorEventTextChanged implements TaskEditorEvent {
  const factory TaskEditorEventTextChanged(final String text) =
      _$TaskEditorEventTextChangedImpl;

  String get text;

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEditorEventTextChangedImplCopyWith<_$TaskEditorEventTextChangedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditorEventIsImageRequiredChangedImplCopyWith<$Res> {
  factory _$$TaskEditorEventIsImageRequiredChangedImplCopyWith(
    _$TaskEditorEventIsImageRequiredChangedImpl value,
    $Res Function(_$TaskEditorEventIsImageRequiredChangedImpl) then,
  ) = __$$TaskEditorEventIsImageRequiredChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$TaskEditorEventIsImageRequiredChangedImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<
          $Res,
          _$TaskEditorEventIsImageRequiredChangedImpl
        >
    implements _$$TaskEditorEventIsImageRequiredChangedImplCopyWith<$Res> {
  __$$TaskEditorEventIsImageRequiredChangedImplCopyWithImpl(
    _$TaskEditorEventIsImageRequiredChangedImpl _value,
    $Res Function(_$TaskEditorEventIsImageRequiredChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$TaskEditorEventIsImageRequiredChangedImpl(
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$TaskEditorEventIsImageRequiredChangedImpl
    implements TaskEditorEventIsImageRequiredChanged {
  const _$TaskEditorEventIsImageRequiredChangedImpl({required this.value});

  @override
  final bool value;

  @override
  String toString() {
    return 'TaskEditorEvent.isImageRequiredChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventIsImageRequiredChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEditorEventIsImageRequiredChangedImplCopyWith<
    _$TaskEditorEventIsImageRequiredChangedImpl
  >
  get copyWith => __$$TaskEditorEventIsImageRequiredChangedImplCopyWithImpl<
    _$TaskEditorEventIsImageRequiredChangedImpl
  >(this, _$identity);
}

abstract class TaskEditorEventIsImageRequiredChanged
    implements TaskEditorEvent {
  const factory TaskEditorEventIsImageRequiredChanged({
    required final bool value,
  }) = _$TaskEditorEventIsImageRequiredChangedImpl;

  bool get value;

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEditorEventIsImageRequiredChangedImplCopyWith<
    _$TaskEditorEventIsImageRequiredChangedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditorEventTimeChangedImplCopyWith<$Res> {
  factory _$$TaskEditorEventTimeChangedImplCopyWith(
    _$TaskEditorEventTimeChangedImpl value,
    $Res Function(_$TaskEditorEventTimeChangedImpl) then,
  ) = __$$TaskEditorEventTimeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration time});
}

/// @nodoc
class __$$TaskEditorEventTimeChangedImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<$Res, _$TaskEditorEventTimeChangedImpl>
    implements _$$TaskEditorEventTimeChangedImplCopyWith<$Res> {
  __$$TaskEditorEventTimeChangedImplCopyWithImpl(
    _$TaskEditorEventTimeChangedImpl _value,
    $Res Function(_$TaskEditorEventTimeChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? time = null}) {
    return _then(
      _$TaskEditorEventTimeChangedImpl(
        null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                as Duration,
      ),
    );
  }
}

/// @nodoc

class _$TaskEditorEventTimeChangedImpl implements TaskEditorEventTimeChanged {
  const _$TaskEditorEventTimeChangedImpl(this.time);

  @override
  final Duration time;

  @override
  String toString() {
    return 'TaskEditorEvent.timeChanged(time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventTimeChangedImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEditorEventTimeChangedImplCopyWith<_$TaskEditorEventTimeChangedImpl>
  get copyWith => __$$TaskEditorEventTimeChangedImplCopyWithImpl<
    _$TaskEditorEventTimeChangedImpl
  >(this, _$identity);
}

abstract class TaskEditorEventTimeChanged implements TaskEditorEvent {
  const factory TaskEditorEventTimeChanged(final Duration time) =
      _$TaskEditorEventTimeChangedImpl;

  Duration get time;

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEditorEventTimeChangedImplCopyWith<_$TaskEditorEventTimeChangedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditorEventDateChangedImplCopyWith<$Res> {
  factory _$$TaskEditorEventDateChangedImplCopyWith(
    _$TaskEditorEventDateChangedImpl value,
    $Res Function(_$TaskEditorEventDateChangedImpl) then,
  ) = __$$TaskEditorEventDateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$TaskEditorEventDateChangedImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<$Res, _$TaskEditorEventDateChangedImpl>
    implements _$$TaskEditorEventDateChangedImplCopyWith<$Res> {
  __$$TaskEditorEventDateChangedImplCopyWithImpl(
    _$TaskEditorEventDateChangedImpl _value,
    $Res Function(_$TaskEditorEventDateChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null}) {
    return _then(
      _$TaskEditorEventDateChangedImpl(
        null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$TaskEditorEventDateChangedImpl implements TaskEditorEventDateChanged {
  const _$TaskEditorEventDateChangedImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'TaskEditorEvent.dateChanged(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventDateChangedImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEditorEventDateChangedImplCopyWith<_$TaskEditorEventDateChangedImpl>
  get copyWith => __$$TaskEditorEventDateChangedImplCopyWithImpl<
    _$TaskEditorEventDateChangedImpl
  >(this, _$identity);
}

abstract class TaskEditorEventDateChanged implements TaskEditorEvent {
  const factory TaskEditorEventDateChanged(final DateTime date) =
      _$TaskEditorEventDateChangedImpl;

  DateTime get date;

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEditorEventDateChangedImplCopyWith<_$TaskEditorEventDateChangedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditorEventWeekdayToggledImplCopyWith<$Res> {
  factory _$$TaskEditorEventWeekdayToggledImplCopyWith(
    _$TaskEditorEventWeekdayToggledImpl value,
    $Res Function(_$TaskEditorEventWeekdayToggledImpl) then,
  ) = __$$TaskEditorEventWeekdayToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int day, bool value});
}

/// @nodoc
class __$$TaskEditorEventWeekdayToggledImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<$Res, _$TaskEditorEventWeekdayToggledImpl>
    implements _$$TaskEditorEventWeekdayToggledImplCopyWith<$Res> {
  __$$TaskEditorEventWeekdayToggledImplCopyWithImpl(
    _$TaskEditorEventWeekdayToggledImpl _value,
    $Res Function(_$TaskEditorEventWeekdayToggledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? day = null, Object? value = null}) {
    return _then(
      _$TaskEditorEventWeekdayToggledImpl(
        day:
            null == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                    as int,
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$TaskEditorEventWeekdayToggledImpl
    implements TaskEditorEventWeekdayToggled {
  const _$TaskEditorEventWeekdayToggledImpl({
    required this.day,
    required this.value,
  });

  @override
  final int day;
  @override
  final bool value;

  @override
  String toString() {
    return 'TaskEditorEvent.weekdayToggled(day: $day, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventWeekdayToggledImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, day, value);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEditorEventWeekdayToggledImplCopyWith<
    _$TaskEditorEventWeekdayToggledImpl
  >
  get copyWith => __$$TaskEditorEventWeekdayToggledImplCopyWithImpl<
    _$TaskEditorEventWeekdayToggledImpl
  >(this, _$identity);
}

abstract class TaskEditorEventWeekdayToggled implements TaskEditorEvent {
  const factory TaskEditorEventWeekdayToggled({
    required final int day,
    required final bool value,
  }) = _$TaskEditorEventWeekdayToggledImpl;

  int get day;
  bool get value;

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEditorEventWeekdayToggledImplCopyWith<
    _$TaskEditorEventWeekdayToggledImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditorEventExecutivesAddedImplCopyWith<$Res> {
  factory _$$TaskEditorEventExecutivesAddedImplCopyWith(
    _$TaskEditorEventExecutivesAddedImpl value,
    $Res Function(_$TaskEditorEventExecutivesAddedImpl) then,
  ) = __$$TaskEditorEventExecutivesAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Profile> executives});
}

/// @nodoc
class __$$TaskEditorEventExecutivesAddedImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<
          $Res,
          _$TaskEditorEventExecutivesAddedImpl
        >
    implements _$$TaskEditorEventExecutivesAddedImplCopyWith<$Res> {
  __$$TaskEditorEventExecutivesAddedImplCopyWithImpl(
    _$TaskEditorEventExecutivesAddedImpl _value,
    $Res Function(_$TaskEditorEventExecutivesAddedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? executives = null}) {
    return _then(
      _$TaskEditorEventExecutivesAddedImpl(
        null == executives
            ? _value._executives
            : executives // ignore: cast_nullable_to_non_nullable
                as List<Profile>,
      ),
    );
  }
}

/// @nodoc

class _$TaskEditorEventExecutivesAddedImpl
    implements TaskEditorEventExecutivesAdded {
  const _$TaskEditorEventExecutivesAddedImpl(final List<Profile> executives)
    : _executives = executives;

  final List<Profile> _executives;
  @override
  List<Profile> get executives {
    if (_executives is EqualUnmodifiableListView) return _executives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_executives);
  }

  @override
  String toString() {
    return 'TaskEditorEvent.executivesAdded(executives: $executives)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventExecutivesAddedImpl &&
            const DeepCollectionEquality().equals(
              other._executives,
              _executives,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_executives),
  );

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEditorEventExecutivesAddedImplCopyWith<
    _$TaskEditorEventExecutivesAddedImpl
  >
  get copyWith => __$$TaskEditorEventExecutivesAddedImplCopyWithImpl<
    _$TaskEditorEventExecutivesAddedImpl
  >(this, _$identity);
}

abstract class TaskEditorEventExecutivesAdded implements TaskEditorEvent {
  const factory TaskEditorEventExecutivesAdded(final List<Profile> executives) =
      _$TaskEditorEventExecutivesAddedImpl;

  List<Profile> get executives;

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEditorEventExecutivesAddedImplCopyWith<
    _$TaskEditorEventExecutivesAddedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditorEventExecutiveRemovedImplCopyWith<$Res> {
  factory _$$TaskEditorEventExecutiveRemovedImplCopyWith(
    _$TaskEditorEventExecutiveRemovedImpl value,
    $Res Function(_$TaskEditorEventExecutiveRemovedImpl) then,
  ) = __$$TaskEditorEventExecutiveRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$TaskEditorEventExecutiveRemovedImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<
          $Res,
          _$TaskEditorEventExecutiveRemovedImpl
        >
    implements _$$TaskEditorEventExecutiveRemovedImplCopyWith<$Res> {
  __$$TaskEditorEventExecutiveRemovedImplCopyWithImpl(
    _$TaskEditorEventExecutiveRemovedImpl _value,
    $Res Function(_$TaskEditorEventExecutiveRemovedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _$TaskEditorEventExecutiveRemovedImpl(
        null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$TaskEditorEventExecutiveRemovedImpl
    implements TaskEditorEventExecutiveRemoved {
  const _$TaskEditorEventExecutiveRemovedImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'TaskEditorEvent.executiveRemoved(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventExecutiveRemovedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEditorEventExecutiveRemovedImplCopyWith<
    _$TaskEditorEventExecutiveRemovedImpl
  >
  get copyWith => __$$TaskEditorEventExecutiveRemovedImplCopyWithImpl<
    _$TaskEditorEventExecutiveRemovedImpl
  >(this, _$identity);
}

abstract class TaskEditorEventExecutiveRemoved implements TaskEditorEvent {
  const factory TaskEditorEventExecutiveRemoved(final int index) =
      _$TaskEditorEventExecutiveRemovedImpl;

  int get index;

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEditorEventExecutiveRemovedImplCopyWith<
    _$TaskEditorEventExecutiveRemovedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditorEventSaveRequestedImplCopyWith<$Res> {
  factory _$$TaskEditorEventSaveRequestedImplCopyWith(
    _$TaskEditorEventSaveRequestedImpl value,
    $Res Function(_$TaskEditorEventSaveRequestedImpl) then,
  ) = __$$TaskEditorEventSaveRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskEditorEventSaveRequestedImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<$Res, _$TaskEditorEventSaveRequestedImpl>
    implements _$$TaskEditorEventSaveRequestedImplCopyWith<$Res> {
  __$$TaskEditorEventSaveRequestedImplCopyWithImpl(
    _$TaskEditorEventSaveRequestedImpl _value,
    $Res Function(_$TaskEditorEventSaveRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskEditorEventSaveRequestedImpl
    implements TaskEditorEventSaveRequested {
  const _$TaskEditorEventSaveRequestedImpl();

  @override
  String toString() {
    return 'TaskEditorEvent.saveRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventSaveRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class TaskEditorEventSaveRequested implements TaskEditorEvent {
  const factory TaskEditorEventSaveRequested() =
      _$TaskEditorEventSaveRequestedImpl;
}

/// @nodoc
abstract class _$$TaskEditorEventDeleteRequestedImplCopyWith<$Res> {
  factory _$$TaskEditorEventDeleteRequestedImplCopyWith(
    _$TaskEditorEventDeleteRequestedImpl value,
    $Res Function(_$TaskEditorEventDeleteRequestedImpl) then,
  ) = __$$TaskEditorEventDeleteRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskEditorEventDeleteRequestedImplCopyWithImpl<$Res>
    extends
        _$TaskEditorEventCopyWithImpl<
          $Res,
          _$TaskEditorEventDeleteRequestedImpl
        >
    implements _$$TaskEditorEventDeleteRequestedImplCopyWith<$Res> {
  __$$TaskEditorEventDeleteRequestedImplCopyWithImpl(
    _$TaskEditorEventDeleteRequestedImpl _value,
    $Res Function(_$TaskEditorEventDeleteRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskEditorEventDeleteRequestedImpl
    implements TaskEditorEventDeleteRequested {
  const _$TaskEditorEventDeleteRequestedImpl();

  @override
  String toString() {
    return 'TaskEditorEvent.deleteRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorEventDeleteRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class TaskEditorEventDeleteRequested implements TaskEditorEvent {
  const factory TaskEditorEventDeleteRequested() =
      _$TaskEditorEventDeleteRequestedImpl;
}

/// @nodoc
mixin _$TaskEditorState {
  bool get isNew => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  Status<String> get loadingState => throw _privateConstructorUsedError;
  bool get isPlanned => throw _privateConstructorUsedError;
  bool get isRepeated => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String? get textError => throw _privateConstructorUsedError;
  bool get isImageRequired => throw _privateConstructorUsedError;
  Duration get time => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get weekdays => throw _privateConstructorUsedError;
  List<Profile> get executives => throw _privateConstructorUsedError;
  OperationStatus<String> get uploadState => throw _privateConstructorUsedError;
  OperationStatus<String> get deleteState => throw _privateConstructorUsedError;

  /// Create a copy of TaskEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskEditorStateCopyWith<TaskEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEditorStateCopyWith<$Res> {
  factory $TaskEditorStateCopyWith(
    TaskEditorState value,
    $Res Function(TaskEditorState) then,
  ) = _$TaskEditorStateCopyWithImpl<$Res, TaskEditorState>;
  @useResult
  $Res call({
    bool isNew,
    int id,
    Status<String> loadingState,
    bool isPlanned,
    bool isRepeated,
    String text,
    String? textError,
    bool isImageRequired,
    Duration time,
    DateTime date,
    int weekdays,
    List<Profile> executives,
    OperationStatus<String> uploadState,
    OperationStatus<String> deleteState,
  });

  $StatusCopyWith<String, $Res> get loadingState;
  $OperationStatusCopyWith<String, $Res> get uploadState;
  $OperationStatusCopyWith<String, $Res> get deleteState;
}

/// @nodoc
class _$TaskEditorStateCopyWithImpl<$Res, $Val extends TaskEditorState>
    implements $TaskEditorStateCopyWith<$Res> {
  _$TaskEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNew = null,
    Object? id = null,
    Object? loadingState = null,
    Object? isPlanned = null,
    Object? isRepeated = null,
    Object? text = null,
    Object? textError = freezed,
    Object? isImageRequired = null,
    Object? time = null,
    Object? date = null,
    Object? weekdays = null,
    Object? executives = null,
    Object? uploadState = null,
    Object? deleteState = null,
  }) {
    return _then(
      _value.copyWith(
            isNew:
                null == isNew
                    ? _value.isNew
                    : isNew // ignore: cast_nullable_to_non_nullable
                        as bool,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            loadingState:
                null == loadingState
                    ? _value.loadingState
                    : loadingState // ignore: cast_nullable_to_non_nullable
                        as Status<String>,
            isPlanned:
                null == isPlanned
                    ? _value.isPlanned
                    : isPlanned // ignore: cast_nullable_to_non_nullable
                        as bool,
            isRepeated:
                null == isRepeated
                    ? _value.isRepeated
                    : isRepeated // ignore: cast_nullable_to_non_nullable
                        as bool,
            text:
                null == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String,
            textError:
                freezed == textError
                    ? _value.textError
                    : textError // ignore: cast_nullable_to_non_nullable
                        as String?,
            isImageRequired:
                null == isImageRequired
                    ? _value.isImageRequired
                    : isImageRequired // ignore: cast_nullable_to_non_nullable
                        as bool,
            time:
                null == time
                    ? _value.time
                    : time // ignore: cast_nullable_to_non_nullable
                        as Duration,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            weekdays:
                null == weekdays
                    ? _value.weekdays
                    : weekdays // ignore: cast_nullable_to_non_nullable
                        as int,
            executives:
                null == executives
                    ? _value.executives
                    : executives // ignore: cast_nullable_to_non_nullable
                        as List<Profile>,
            uploadState:
                null == uploadState
                    ? _value.uploadState
                    : uploadState // ignore: cast_nullable_to_non_nullable
                        as OperationStatus<String>,
            deleteState:
                null == deleteState
                    ? _value.deleteState
                    : deleteState // ignore: cast_nullable_to_non_nullable
                        as OperationStatus<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of TaskEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<String, $Res> get loadingState {
    return $StatusCopyWith<String, $Res>(_value.loadingState, (value) {
      return _then(_value.copyWith(loadingState: value) as $Val);
    });
  }

  /// Create a copy of TaskEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<String, $Res> get uploadState {
    return $OperationStatusCopyWith<String, $Res>(_value.uploadState, (value) {
      return _then(_value.copyWith(uploadState: value) as $Val);
    });
  }

  /// Create a copy of TaskEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<String, $Res> get deleteState {
    return $OperationStatusCopyWith<String, $Res>(_value.deleteState, (value) {
      return _then(_value.copyWith(deleteState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskEditorStateImplCopyWith<$Res>
    implements $TaskEditorStateCopyWith<$Res> {
  factory _$$TaskEditorStateImplCopyWith(
    _$TaskEditorStateImpl value,
    $Res Function(_$TaskEditorStateImpl) then,
  ) = __$$TaskEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isNew,
    int id,
    Status<String> loadingState,
    bool isPlanned,
    bool isRepeated,
    String text,
    String? textError,
    bool isImageRequired,
    Duration time,
    DateTime date,
    int weekdays,
    List<Profile> executives,
    OperationStatus<String> uploadState,
    OperationStatus<String> deleteState,
  });

  @override
  $StatusCopyWith<String, $Res> get loadingState;
  @override
  $OperationStatusCopyWith<String, $Res> get uploadState;
  @override
  $OperationStatusCopyWith<String, $Res> get deleteState;
}

/// @nodoc
class __$$TaskEditorStateImplCopyWithImpl<$Res>
    extends _$TaskEditorStateCopyWithImpl<$Res, _$TaskEditorStateImpl>
    implements _$$TaskEditorStateImplCopyWith<$Res> {
  __$$TaskEditorStateImplCopyWithImpl(
    _$TaskEditorStateImpl _value,
    $Res Function(_$TaskEditorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNew = null,
    Object? id = null,
    Object? loadingState = null,
    Object? isPlanned = null,
    Object? isRepeated = null,
    Object? text = null,
    Object? textError = freezed,
    Object? isImageRequired = null,
    Object? time = null,
    Object? date = null,
    Object? weekdays = null,
    Object? executives = null,
    Object? uploadState = null,
    Object? deleteState = null,
  }) {
    return _then(
      _$TaskEditorStateImpl(
        isNew:
            null == isNew
                ? _value.isNew
                : isNew // ignore: cast_nullable_to_non_nullable
                    as bool,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        loadingState:
            null == loadingState
                ? _value.loadingState
                : loadingState // ignore: cast_nullable_to_non_nullable
                    as Status<String>,
        isPlanned:
            null == isPlanned
                ? _value.isPlanned
                : isPlanned // ignore: cast_nullable_to_non_nullable
                    as bool,
        isRepeated:
            null == isRepeated
                ? _value.isRepeated
                : isRepeated // ignore: cast_nullable_to_non_nullable
                    as bool,
        text:
            null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String,
        textError:
            freezed == textError
                ? _value.textError
                : textError // ignore: cast_nullable_to_non_nullable
                    as String?,
        isImageRequired:
            null == isImageRequired
                ? _value.isImageRequired
                : isImageRequired // ignore: cast_nullable_to_non_nullable
                    as bool,
        time:
            null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                    as Duration,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        weekdays:
            null == weekdays
                ? _value.weekdays
                : weekdays // ignore: cast_nullable_to_non_nullable
                    as int,
        executives:
            null == executives
                ? _value._executives
                : executives // ignore: cast_nullable_to_non_nullable
                    as List<Profile>,
        uploadState:
            null == uploadState
                ? _value.uploadState
                : uploadState // ignore: cast_nullable_to_non_nullable
                    as OperationStatus<String>,
        deleteState:
            null == deleteState
                ? _value.deleteState
                : deleteState // ignore: cast_nullable_to_non_nullable
                    as OperationStatus<String>,
      ),
    );
  }
}

/// @nodoc

class _$TaskEditorStateImpl implements _TaskEditorState {
  const _$TaskEditorStateImpl({
    required this.isNew,
    required this.id,
    required this.loadingState,
    required this.isPlanned,
    required this.isRepeated,
    required this.text,
    required this.textError,
    required this.isImageRequired,
    required this.time,
    required this.date,
    required this.weekdays,
    required final List<Profile> executives,
    required this.uploadState,
    required this.deleteState,
  }) : _executives = executives;

  @override
  final bool isNew;
  @override
  final int id;
  @override
  final Status<String> loadingState;
  @override
  final bool isPlanned;
  @override
  final bool isRepeated;
  @override
  final String text;
  @override
  final String? textError;
  @override
  final bool isImageRequired;
  @override
  final Duration time;
  @override
  final DateTime date;
  @override
  final int weekdays;
  final List<Profile> _executives;
  @override
  List<Profile> get executives {
    if (_executives is EqualUnmodifiableListView) return _executives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_executives);
  }

  @override
  final OperationStatus<String> uploadState;
  @override
  final OperationStatus<String> deleteState;

  @override
  String toString() {
    return 'TaskEditorState(isNew: $isNew, id: $id, loadingState: $loadingState, isPlanned: $isPlanned, isRepeated: $isRepeated, text: $text, textError: $textError, isImageRequired: $isImageRequired, time: $time, date: $date, weekdays: $weekdays, executives: $executives, uploadState: $uploadState, deleteState: $deleteState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditorStateImpl &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.isPlanned, isPlanned) ||
                other.isPlanned == isPlanned) &&
            (identical(other.isRepeated, isRepeated) ||
                other.isRepeated == isRepeated) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.textError, textError) ||
                other.textError == textError) &&
            (identical(other.isImageRequired, isImageRequired) ||
                other.isImageRequired == isImageRequired) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.weekdays, weekdays) ||
                other.weekdays == weekdays) &&
            const DeepCollectionEquality().equals(
              other._executives,
              _executives,
            ) &&
            (identical(other.uploadState, uploadState) ||
                other.uploadState == uploadState) &&
            (identical(other.deleteState, deleteState) ||
                other.deleteState == deleteState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isNew,
    id,
    loadingState,
    isPlanned,
    isRepeated,
    text,
    textError,
    isImageRequired,
    time,
    date,
    weekdays,
    const DeepCollectionEquality().hash(_executives),
    uploadState,
    deleteState,
  );

  /// Create a copy of TaskEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEditorStateImplCopyWith<_$TaskEditorStateImpl> get copyWith =>
      __$$TaskEditorStateImplCopyWithImpl<_$TaskEditorStateImpl>(
        this,
        _$identity,
      );
}

abstract class _TaskEditorState implements TaskEditorState {
  const factory _TaskEditorState({
    required final bool isNew,
    required final int id,
    required final Status<String> loadingState,
    required final bool isPlanned,
    required final bool isRepeated,
    required final String text,
    required final String? textError,
    required final bool isImageRequired,
    required final Duration time,
    required final DateTime date,
    required final int weekdays,
    required final List<Profile> executives,
    required final OperationStatus<String> uploadState,
    required final OperationStatus<String> deleteState,
  }) = _$TaskEditorStateImpl;

  @override
  bool get isNew;
  @override
  int get id;
  @override
  Status<String> get loadingState;
  @override
  bool get isPlanned;
  @override
  bool get isRepeated;
  @override
  String get text;
  @override
  String? get textError;
  @override
  bool get isImageRequired;
  @override
  Duration get time;
  @override
  DateTime get date;
  @override
  int get weekdays;
  @override
  List<Profile> get executives;
  @override
  OperationStatus<String> get uploadState;
  @override
  OperationStatus<String> get deleteState;

  /// Create a copy of TaskEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEditorStateImplCopyWith<_$TaskEditorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

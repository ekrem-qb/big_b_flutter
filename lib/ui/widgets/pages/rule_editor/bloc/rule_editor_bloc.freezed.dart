// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RuleEditorEvent {}

/// @nodoc
abstract class $RuleEditorEventCopyWith<$Res> {
  factory $RuleEditorEventCopyWith(
          RuleEditorEvent value, $Res Function(RuleEditorEvent) then) =
      _$RuleEditorEventCopyWithImpl<$Res, RuleEditorEvent>;
}

/// @nodoc
class _$RuleEditorEventCopyWithImpl<$Res, $Val extends RuleEditorEvent>
    implements $RuleEditorEventCopyWith<$Res> {
  _$RuleEditorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RuleEditorEventLoadRequestedImplCopyWith<$Res> {
  factory _$$RuleEditorEventLoadRequestedImplCopyWith(
          _$RuleEditorEventLoadRequestedImpl value,
          $Res Function(_$RuleEditorEventLoadRequestedImpl) then) =
      __$$RuleEditorEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RuleEditorEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventLoadRequestedImpl>
    implements _$$RuleEditorEventLoadRequestedImplCopyWith<$Res> {
  __$$RuleEditorEventLoadRequestedImplCopyWithImpl(
      _$RuleEditorEventLoadRequestedImpl _value,
      $Res Function(_$RuleEditorEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RuleEditorEventLoadRequestedImpl
    implements RuleEditorEventLoadRequested {
  const _$RuleEditorEventLoadRequestedImpl();

  @override
  String toString() {
    return 'RuleEditorEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RuleEditorEventLoadRequested implements RuleEditorEvent {
  const factory RuleEditorEventLoadRequested() =
      _$RuleEditorEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$RuleEditorEventDescriptionChangedImplCopyWith<$Res> {
  factory _$$RuleEditorEventDescriptionChangedImplCopyWith(
          _$RuleEditorEventDescriptionChangedImpl value,
          $Res Function(_$RuleEditorEventDescriptionChangedImpl) then) =
      __$$RuleEditorEventDescriptionChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$RuleEditorEventDescriptionChangedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventDescriptionChangedImpl>
    implements _$$RuleEditorEventDescriptionChangedImplCopyWith<$Res> {
  __$$RuleEditorEventDescriptionChangedImplCopyWithImpl(
      _$RuleEditorEventDescriptionChangedImpl _value,
      $Res Function(_$RuleEditorEventDescriptionChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RuleEditorEventDescriptionChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RuleEditorEventDescriptionChangedImpl
    implements RuleEditorEventDescriptionChanged {
  const _$RuleEditorEventDescriptionChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RuleEditorEvent.descriptionChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventDescriptionChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventDescriptionChangedImplCopyWith<
          _$RuleEditorEventDescriptionChangedImpl>
      get copyWith => __$$RuleEditorEventDescriptionChangedImplCopyWithImpl<
          _$RuleEditorEventDescriptionChangedImpl>(this, _$identity);
}

abstract class RuleEditorEventDescriptionChanged implements RuleEditorEvent {
  const factory RuleEditorEventDescriptionChanged(final String value) =
      _$RuleEditorEventDescriptionChangedImpl;

  String get value;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventDescriptionChangedImplCopyWith<
          _$RuleEditorEventDescriptionChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorEventDetailsChangedImplCopyWith<$Res> {
  factory _$$RuleEditorEventDetailsChangedImplCopyWith(
          _$RuleEditorEventDetailsChangedImpl value,
          $Res Function(_$RuleEditorEventDetailsChangedImpl) then) =
      __$$RuleEditorEventDetailsChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$RuleEditorEventDetailsChangedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventDetailsChangedImpl>
    implements _$$RuleEditorEventDetailsChangedImplCopyWith<$Res> {
  __$$RuleEditorEventDetailsChangedImplCopyWithImpl(
      _$RuleEditorEventDetailsChangedImpl _value,
      $Res Function(_$RuleEditorEventDetailsChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RuleEditorEventDetailsChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RuleEditorEventDetailsChangedImpl
    implements RuleEditorEventDetailsChanged {
  const _$RuleEditorEventDetailsChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RuleEditorEvent.detailsChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventDetailsChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventDetailsChangedImplCopyWith<
          _$RuleEditorEventDetailsChangedImpl>
      get copyWith => __$$RuleEditorEventDetailsChangedImplCopyWithImpl<
          _$RuleEditorEventDetailsChangedImpl>(this, _$identity);
}

abstract class RuleEditorEventDetailsChanged implements RuleEditorEvent {
  const factory RuleEditorEventDetailsChanged(final String value) =
      _$RuleEditorEventDetailsChangedImpl;

  String get value;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventDetailsChangedImplCopyWith<
          _$RuleEditorEventDetailsChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorEventColorChangedImplCopyWith<$Res> {
  factory _$$RuleEditorEventColorChangedImplCopyWith(
          _$RuleEditorEventColorChangedImpl value,
          $Res Function(_$RuleEditorEventColorChangedImpl) then) =
      __$$RuleEditorEventColorChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Color value});
}

/// @nodoc
class __$$RuleEditorEventColorChangedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventColorChangedImpl>
    implements _$$RuleEditorEventColorChangedImplCopyWith<$Res> {
  __$$RuleEditorEventColorChangedImplCopyWithImpl(
      _$RuleEditorEventColorChangedImpl _value,
      $Res Function(_$RuleEditorEventColorChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RuleEditorEventColorChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$RuleEditorEventColorChangedImpl implements RuleEditorEventColorChanged {
  const _$RuleEditorEventColorChangedImpl(this.value);

  @override
  final Color value;

  @override
  String toString() {
    return 'RuleEditorEvent.colorChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventColorChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventColorChangedImplCopyWith<_$RuleEditorEventColorChangedImpl>
      get copyWith => __$$RuleEditorEventColorChangedImplCopyWithImpl<
          _$RuleEditorEventColorChangedImpl>(this, _$identity);
}

abstract class RuleEditorEventColorChanged implements RuleEditorEvent {
  const factory RuleEditorEventColorChanged(final Color value) =
      _$RuleEditorEventColorChangedImpl;

  Color get value;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventColorChangedImplCopyWith<_$RuleEditorEventColorChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorEventSaveRequestedImplCopyWith<$Res> {
  factory _$$RuleEditorEventSaveRequestedImplCopyWith(
          _$RuleEditorEventSaveRequestedImpl value,
          $Res Function(_$RuleEditorEventSaveRequestedImpl) then) =
      __$$RuleEditorEventSaveRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RuleEditorEventSaveRequestedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventSaveRequestedImpl>
    implements _$$RuleEditorEventSaveRequestedImplCopyWith<$Res> {
  __$$RuleEditorEventSaveRequestedImplCopyWithImpl(
      _$RuleEditorEventSaveRequestedImpl _value,
      $Res Function(_$RuleEditorEventSaveRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RuleEditorEventSaveRequestedImpl
    implements RuleEditorEventSaveRequested {
  const _$RuleEditorEventSaveRequestedImpl();

  @override
  String toString() {
    return 'RuleEditorEvent.saveRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventSaveRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RuleEditorEventSaveRequested implements RuleEditorEvent {
  const factory RuleEditorEventSaveRequested() =
      _$RuleEditorEventSaveRequestedImpl;
}

/// @nodoc
abstract class _$$RuleEditorEventDeleteDialogOpenedImplCopyWith<$Res> {
  factory _$$RuleEditorEventDeleteDialogOpenedImplCopyWith(
          _$RuleEditorEventDeleteDialogOpenedImpl value,
          $Res Function(_$RuleEditorEventDeleteDialogOpenedImpl) then) =
      __$$RuleEditorEventDeleteDialogOpenedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RuleEditorEventDeleteDialogOpenedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventDeleteDialogOpenedImpl>
    implements _$$RuleEditorEventDeleteDialogOpenedImplCopyWith<$Res> {
  __$$RuleEditorEventDeleteDialogOpenedImplCopyWithImpl(
      _$RuleEditorEventDeleteDialogOpenedImpl _value,
      $Res Function(_$RuleEditorEventDeleteDialogOpenedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RuleEditorEventDeleteDialogOpenedImpl
    implements RuleEditorEventDeleteDialogOpened {
  const _$RuleEditorEventDeleteDialogOpenedImpl();

  @override
  String toString() {
    return 'RuleEditorEvent.deleteDialogOpened()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventDeleteDialogOpenedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RuleEditorEventDeleteDialogOpened implements RuleEditorEvent {
  const factory RuleEditorEventDeleteDialogOpened() =
      _$RuleEditorEventDeleteDialogOpenedImpl;
}

/// @nodoc
abstract class _$$RuleEditorEventDeleteDialogClosedImplCopyWith<$Res> {
  factory _$$RuleEditorEventDeleteDialogClosedImplCopyWith(
          _$RuleEditorEventDeleteDialogClosedImpl value,
          $Res Function(_$RuleEditorEventDeleteDialogClosedImpl) then) =
      __$$RuleEditorEventDeleteDialogClosedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDeleted});
}

/// @nodoc
class __$$RuleEditorEventDeleteDialogClosedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventDeleteDialogClosedImpl>
    implements _$$RuleEditorEventDeleteDialogClosedImplCopyWith<$Res> {
  __$$RuleEditorEventDeleteDialogClosedImplCopyWithImpl(
      _$RuleEditorEventDeleteDialogClosedImpl _value,
      $Res Function(_$RuleEditorEventDeleteDialogClosedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDeleted = null,
  }) {
    return _then(_$RuleEditorEventDeleteDialogClosedImpl(
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RuleEditorEventDeleteDialogClosedImpl
    implements RuleEditorEventDeleteDialogClosed {
  const _$RuleEditorEventDeleteDialogClosedImpl({required this.isDeleted});

  @override
  final bool isDeleted;

  @override
  String toString() {
    return 'RuleEditorEvent.deleteDialogClosed(isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventDeleteDialogClosedImpl &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDeleted);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventDeleteDialogClosedImplCopyWith<
          _$RuleEditorEventDeleteDialogClosedImpl>
      get copyWith => __$$RuleEditorEventDeleteDialogClosedImplCopyWithImpl<
          _$RuleEditorEventDeleteDialogClosedImpl>(this, _$identity);
}

abstract class RuleEditorEventDeleteDialogClosed implements RuleEditorEvent {
  const factory RuleEditorEventDeleteDialogClosed(
          {required final bool isDeleted}) =
      _$RuleEditorEventDeleteDialogClosedImpl;

  bool get isDeleted;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventDeleteDialogClosedImplCopyWith<
          _$RuleEditorEventDeleteDialogClosedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RuleEditorState {}

/// @nodoc
abstract class $RuleEditorStateCopyWith<$Res> {
  factory $RuleEditorStateCopyWith(
          RuleEditorState value, $Res Function(RuleEditorState) then) =
      _$RuleEditorStateCopyWithImpl<$Res, RuleEditorState>;
}

/// @nodoc
class _$RuleEditorStateCopyWithImpl<$Res, $Val extends RuleEditorState>
    implements $RuleEditorStateCopyWith<$Res> {
  _$RuleEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RuleEditorStateCreateImplCopyWith<$Res> {
  factory _$$RuleEditorStateCreateImplCopyWith(
          _$RuleEditorStateCreateImpl value,
          $Res Function(_$RuleEditorStateCreateImpl) then) =
      __$$RuleEditorStateCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Rule rule, String? descriptionError, OperationStatus uploadState});

  $RuleCopyWith<$Res> get rule;
  $OperationStatusCopyWith<$Res> get uploadState;
}

/// @nodoc
class __$$RuleEditorStateCreateImplCopyWithImpl<$Res>
    extends _$RuleEditorStateCopyWithImpl<$Res, _$RuleEditorStateCreateImpl>
    implements _$$RuleEditorStateCreateImplCopyWith<$Res> {
  __$$RuleEditorStateCreateImplCopyWithImpl(_$RuleEditorStateCreateImpl _value,
      $Res Function(_$RuleEditorStateCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
    Object? descriptionError = freezed,
    Object? uploadState = null,
  }) {
    return _then(_$RuleEditorStateCreateImpl(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as Rule,
      descriptionError: freezed == descriptionError
          ? _value.descriptionError
          : descriptionError // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadState: null == uploadState
          ? _value.uploadState
          : uploadState // ignore: cast_nullable_to_non_nullable
              as OperationStatus,
    ));
  }

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RuleCopyWith<$Res> get rule {
    return $RuleCopyWith<$Res>(_value.rule, (value) {
      return _then(_value.copyWith(rule: value));
    });
  }

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<$Res> get uploadState {
    return $OperationStatusCopyWith<$Res>(_value.uploadState, (value) {
      return _then(_value.copyWith(uploadState: value));
    });
  }
}

/// @nodoc

class _$RuleEditorStateCreateImpl implements RuleEditorStateCreate {
  const _$RuleEditorStateCreateImpl(
      {this.rule =
          const Rule(id: -1, description: '', details: '', color: Colors.red),
      this.descriptionError,
      this.uploadState = const OperationStatusInitial()});

  @override
  @JsonKey()
  final Rule rule;
  @override
  final String? descriptionError;
  @override
  @JsonKey()
  final OperationStatus uploadState;

  @override
  String toString() {
    return 'RuleEditorState.create(rule: $rule, descriptionError: $descriptionError, uploadState: $uploadState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateCreateImpl &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.descriptionError, descriptionError) ||
                other.descriptionError == descriptionError) &&
            (identical(other.uploadState, uploadState) ||
                other.uploadState == uploadState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, rule, descriptionError, uploadState);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorStateCreateImplCopyWith<_$RuleEditorStateCreateImpl>
      get copyWith => __$$RuleEditorStateCreateImplCopyWithImpl<
          _$RuleEditorStateCreateImpl>(this, _$identity);
}

abstract class RuleEditorStateCreate implements RuleEditorState {
  const factory RuleEditorStateCreate(
      {final Rule rule,
      final String? descriptionError,
      final OperationStatus uploadState}) = _$RuleEditorStateCreateImpl;

  Rule get rule;
  String? get descriptionError;
  OperationStatus get uploadState;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateCreateImplCopyWith<_$RuleEditorStateCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorStateEditImplCopyWith<$Res> {
  factory _$$RuleEditorStateEditImplCopyWith(_$RuleEditorStateEditImpl value,
          $Res Function(_$RuleEditorStateEditImpl) then) =
      __$$RuleEditorStateEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, StatusOf<RuleEditorStateEditState> editState});

  $StatusOfCopyWith<RuleEditorStateEditState, $Res> get editState;
}

/// @nodoc
class __$$RuleEditorStateEditImplCopyWithImpl<$Res>
    extends _$RuleEditorStateCopyWithImpl<$Res, _$RuleEditorStateEditImpl>
    implements _$$RuleEditorStateEditImplCopyWith<$Res> {
  __$$RuleEditorStateEditImplCopyWithImpl(_$RuleEditorStateEditImpl _value,
      $Res Function(_$RuleEditorStateEditImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? editState = null,
  }) {
    return _then(_$RuleEditorStateEditImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      editState: null == editState
          ? _value.editState
          : editState // ignore: cast_nullable_to_non_nullable
              as StatusOf<RuleEditorStateEditState>,
    ));
  }

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<RuleEditorStateEditState, $Res> get editState {
    return $StatusOfCopyWith<RuleEditorStateEditState, $Res>(_value.editState,
        (value) {
      return _then(_value.copyWith(editState: value));
    });
  }
}

/// @nodoc

class _$RuleEditorStateEditImpl implements RuleEditorStateEdit {
  const _$RuleEditorStateEditImpl(
      {required this.id, this.editState = const StatusOfLoading()});

  @override
  final int id;
  @override
  @JsonKey()
  final StatusOf<RuleEditorStateEditState> editState;

  @override
  String toString() {
    return 'RuleEditorState.edit(id: $id, editState: $editState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateEditImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.editState, editState) ||
                other.editState == editState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, editState);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorStateEditImplCopyWith<_$RuleEditorStateEditImpl> get copyWith =>
      __$$RuleEditorStateEditImplCopyWithImpl<_$RuleEditorStateEditImpl>(
          this, _$identity);
}

abstract class RuleEditorStateEdit implements RuleEditorState {
  const factory RuleEditorStateEdit(
          {required final int id,
          final StatusOf<RuleEditorStateEditState> editState}) =
      _$RuleEditorStateEditImpl;

  int get id;
  StatusOf<RuleEditorStateEditState> get editState;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateEditImplCopyWith<_$RuleEditorStateEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RuleEditorStateEditState {
  Rule get rule => throw _privateConstructorUsedError;
  String? get descriptionError => throw _privateConstructorUsedError;
  OperationStatus get uploadState => throw _privateConstructorUsedError;
  OperationStatus get deleteState => throw _privateConstructorUsedError;

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RuleEditorStateEditStateCopyWith<RuleEditorStateEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleEditorStateEditStateCopyWith<$Res> {
  factory $RuleEditorStateEditStateCopyWith(RuleEditorStateEditState value,
          $Res Function(RuleEditorStateEditState) then) =
      _$RuleEditorStateEditStateCopyWithImpl<$Res, RuleEditorStateEditState>;
  @useResult
  $Res call(
      {Rule rule,
      String? descriptionError,
      OperationStatus uploadState,
      OperationStatus deleteState});

  $RuleCopyWith<$Res> get rule;
  $OperationStatusCopyWith<$Res> get uploadState;
  $OperationStatusCopyWith<$Res> get deleteState;
}

/// @nodoc
class _$RuleEditorStateEditStateCopyWithImpl<$Res,
        $Val extends RuleEditorStateEditState>
    implements $RuleEditorStateEditStateCopyWith<$Res> {
  _$RuleEditorStateEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
    Object? descriptionError = freezed,
    Object? uploadState = null,
    Object? deleteState = null,
  }) {
    return _then(_value.copyWith(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as Rule,
      descriptionError: freezed == descriptionError
          ? _value.descriptionError
          : descriptionError // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadState: null == uploadState
          ? _value.uploadState
          : uploadState // ignore: cast_nullable_to_non_nullable
              as OperationStatus,
      deleteState: null == deleteState
          ? _value.deleteState
          : deleteState // ignore: cast_nullable_to_non_nullable
              as OperationStatus,
    ) as $Val);
  }

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RuleCopyWith<$Res> get rule {
    return $RuleCopyWith<$Res>(_value.rule, (value) {
      return _then(_value.copyWith(rule: value) as $Val);
    });
  }

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<$Res> get uploadState {
    return $OperationStatusCopyWith<$Res>(_value.uploadState, (value) {
      return _then(_value.copyWith(uploadState: value) as $Val);
    });
  }

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<$Res> get deleteState {
    return $OperationStatusCopyWith<$Res>(_value.deleteState, (value) {
      return _then(_value.copyWith(deleteState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RuleEditorStateEditStateImplCopyWith<$Res>
    implements $RuleEditorStateEditStateCopyWith<$Res> {
  factory _$$RuleEditorStateEditStateImplCopyWith(
          _$RuleEditorStateEditStateImpl value,
          $Res Function(_$RuleEditorStateEditStateImpl) then) =
      __$$RuleEditorStateEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Rule rule,
      String? descriptionError,
      OperationStatus uploadState,
      OperationStatus deleteState});

  @override
  $RuleCopyWith<$Res> get rule;
  @override
  $OperationStatusCopyWith<$Res> get uploadState;
  @override
  $OperationStatusCopyWith<$Res> get deleteState;
}

/// @nodoc
class __$$RuleEditorStateEditStateImplCopyWithImpl<$Res>
    extends _$RuleEditorStateEditStateCopyWithImpl<$Res,
        _$RuleEditorStateEditStateImpl>
    implements _$$RuleEditorStateEditStateImplCopyWith<$Res> {
  __$$RuleEditorStateEditStateImplCopyWithImpl(
      _$RuleEditorStateEditStateImpl _value,
      $Res Function(_$RuleEditorStateEditStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
    Object? descriptionError = freezed,
    Object? uploadState = null,
    Object? deleteState = null,
  }) {
    return _then(_$RuleEditorStateEditStateImpl(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as Rule,
      descriptionError: freezed == descriptionError
          ? _value.descriptionError
          : descriptionError // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadState: null == uploadState
          ? _value.uploadState
          : uploadState // ignore: cast_nullable_to_non_nullable
              as OperationStatus,
      deleteState: null == deleteState
          ? _value.deleteState
          : deleteState // ignore: cast_nullable_to_non_nullable
              as OperationStatus,
    ));
  }
}

/// @nodoc

class _$RuleEditorStateEditStateImpl implements _RuleEditorStateEditState {
  const _$RuleEditorStateEditStateImpl(
      {required this.rule,
      this.descriptionError,
      this.uploadState = const OperationStatusInitial(),
      this.deleteState = const OperationStatusInitial()});

  @override
  final Rule rule;
  @override
  final String? descriptionError;
  @override
  @JsonKey()
  final OperationStatus uploadState;
  @override
  @JsonKey()
  final OperationStatus deleteState;

  @override
  String toString() {
    return 'RuleEditorStateEditState(rule: $rule, descriptionError: $descriptionError, uploadState: $uploadState, deleteState: $deleteState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateEditStateImpl &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.descriptionError, descriptionError) ||
                other.descriptionError == descriptionError) &&
            (identical(other.uploadState, uploadState) ||
                other.uploadState == uploadState) &&
            (identical(other.deleteState, deleteState) ||
                other.deleteState == deleteState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, rule, descriptionError, uploadState, deleteState);

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorStateEditStateImplCopyWith<_$RuleEditorStateEditStateImpl>
      get copyWith => __$$RuleEditorStateEditStateImplCopyWithImpl<
          _$RuleEditorStateEditStateImpl>(this, _$identity);
}

abstract class _RuleEditorStateEditState implements RuleEditorStateEditState {
  const factory _RuleEditorStateEditState(
      {required final Rule rule,
      final String? descriptionError,
      final OperationStatus uploadState,
      final OperationStatus deleteState}) = _$RuleEditorStateEditStateImpl;

  @override
  Rule get rule;
  @override
  String? get descriptionError;
  @override
  OperationStatus get uploadState;
  @override
  OperationStatus get deleteState;

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateEditStateImplCopyWith<_$RuleEditorStateEditStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

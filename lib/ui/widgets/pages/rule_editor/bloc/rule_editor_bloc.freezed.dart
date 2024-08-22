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
    implements _RuleEditorEventLoadRequested {
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

abstract class _RuleEditorEventLoadRequested implements RuleEditorEvent {
  const factory _RuleEditorEventLoadRequested() =
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
abstract class _$$RuleEditorStateEditImplCopyWith<$Res> {
  factory _$$RuleEditorStateEditImplCopyWith(_$RuleEditorStateEditImpl value,
          $Res Function(_$RuleEditorStateEditImpl) then) =
      __$$RuleEditorStateEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      String description,
      String? details,
      Color color,
      String? descriptionError,
      Status uploadState,
      Status deleteState});

  $StatusCopyWith<$Res> get uploadState;
  $StatusCopyWith<$Res> get deleteState;
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
    Object? description = null,
    Object? details = freezed,
    Object? color = null,
    Object? descriptionError = freezed,
    Object? uploadState = null,
    Object? deleteState = null,
  }) {
    return _then(_$RuleEditorStateEditImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      descriptionError: freezed == descriptionError
          ? _value.descriptionError
          : descriptionError // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadState: null == uploadState
          ? _value.uploadState
          : uploadState // ignore: cast_nullable_to_non_nullable
              as Status,
      deleteState: null == deleteState
          ? _value.deleteState
          : deleteState // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get uploadState {
    return $StatusCopyWith<$Res>(_value.uploadState, (value) {
      return _then(_value.copyWith(uploadState: value));
    });
  }

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get deleteState {
    return $StatusCopyWith<$Res>(_value.deleteState, (value) {
      return _then(_value.copyWith(deleteState: value));
    });
  }
}

/// @nodoc

class _$RuleEditorStateEditImpl implements RuleEditorStateEdit {
  const _$RuleEditorStateEditImpl(
      {required this.id,
      required this.description,
      required this.details,
      required this.color,
      this.descriptionError,
      this.uploadState = const StatusInitial(),
      this.deleteState = const StatusInitial()});

  @override
  final int id;
  @override
  final String description;
  @override
  final String? details;
  @override
  final Color color;
  @override
  final String? descriptionError;
  @override
  @JsonKey()
  final Status uploadState;
  @override
  @JsonKey()
  final Status deleteState;

  @override
  String toString() {
    return 'RuleEditorState.edit(id: $id, description: $description, details: $details, color: $color, descriptionError: $descriptionError, uploadState: $uploadState, deleteState: $deleteState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateEditImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.descriptionError, descriptionError) ||
                other.descriptionError == descriptionError) &&
            (identical(other.uploadState, uploadState) ||
                other.uploadState == uploadState) &&
            (identical(other.deleteState, deleteState) ||
                other.deleteState == deleteState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, description, details, color,
      descriptionError, uploadState, deleteState);

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
      required final String description,
      required final String? details,
      required final Color color,
      final String? descriptionError,
      final Status uploadState,
      final Status deleteState}) = _$RuleEditorStateEditImpl;

  int get id;
  String get description;
  String? get details;
  Color get color;
  String? get descriptionError;
  Status get uploadState;
  Status get deleteState;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateEditImplCopyWith<_$RuleEditorStateEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorStateCreateImplCopyWith<$Res> {
  factory _$$RuleEditorStateCreateImplCopyWith(
          _$RuleEditorStateCreateImpl value,
          $Res Function(_$RuleEditorStateCreateImpl) then) =
      __$$RuleEditorStateCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String description,
      String? descriptionError,
      String? details,
      Color color,
      Status uploadState});

  $StatusCopyWith<$Res> get uploadState;
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
    Object? description = null,
    Object? descriptionError = freezed,
    Object? details = freezed,
    Object? color = null,
    Object? uploadState = null,
  }) {
    return _then(_$RuleEditorStateCreateImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionError: freezed == descriptionError
          ? _value.descriptionError
          : descriptionError // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      uploadState: null == uploadState
          ? _value.uploadState
          : uploadState // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get uploadState {
    return $StatusCopyWith<$Res>(_value.uploadState, (value) {
      return _then(_value.copyWith(uploadState: value));
    });
  }
}

/// @nodoc

class _$RuleEditorStateCreateImpl implements RuleEditorStateCreate {
  const _$RuleEditorStateCreateImpl(
      {this.description = '',
      this.descriptionError,
      this.details = '',
      this.color = Colors.red,
      this.uploadState = const StatusInitial()});

  @override
  @JsonKey()
  final String description;
  @override
  final String? descriptionError;
  @override
  @JsonKey()
  final String? details;
  @override
  @JsonKey()
  final Color color;
  @override
  @JsonKey()
  final Status uploadState;

  @override
  String toString() {
    return 'RuleEditorState.create(description: $description, descriptionError: $descriptionError, details: $details, color: $color, uploadState: $uploadState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateCreateImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionError, descriptionError) ||
                other.descriptionError == descriptionError) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.uploadState, uploadState) ||
                other.uploadState == uploadState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, description, descriptionError, details, color, uploadState);

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
      {final String description,
      final String? descriptionError,
      final String? details,
      final Color color,
      final Status uploadState}) = _$RuleEditorStateCreateImpl;

  String get description;
  String? get descriptionError;
  String? get details;
  Color get color;
  Status get uploadState;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateCreateImplCopyWith<_$RuleEditorStateCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorStateLoadingImplCopyWith<$Res> {
  factory _$$RuleEditorStateLoadingImplCopyWith(
          _$RuleEditorStateLoadingImpl value,
          $Res Function(_$RuleEditorStateLoadingImpl) then) =
      __$$RuleEditorStateLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RuleEditorStateLoadingImplCopyWithImpl<$Res>
    extends _$RuleEditorStateCopyWithImpl<$Res, _$RuleEditorStateLoadingImpl>
    implements _$$RuleEditorStateLoadingImplCopyWith<$Res> {
  __$$RuleEditorStateLoadingImplCopyWithImpl(
      _$RuleEditorStateLoadingImpl _value,
      $Res Function(_$RuleEditorStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RuleEditorStateLoadingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RuleEditorStateLoadingImpl implements RuleEditorStateLoading {
  const _$RuleEditorStateLoadingImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'RuleEditorState.loading(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateLoadingImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorStateLoadingImplCopyWith<_$RuleEditorStateLoadingImpl>
      get copyWith => __$$RuleEditorStateLoadingImplCopyWithImpl<
          _$RuleEditorStateLoadingImpl>(this, _$identity);
}

abstract class RuleEditorStateLoading implements RuleEditorState {
  const factory RuleEditorStateLoading({required final int id}) =
      _$RuleEditorStateLoadingImpl;

  int get id;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateLoadingImplCopyWith<_$RuleEditorStateLoadingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorStateErrorImplCopyWith<$Res> {
  factory _$$RuleEditorStateErrorImplCopyWith(_$RuleEditorStateErrorImpl value,
          $Res Function(_$RuleEditorStateErrorImpl) then) =
      __$$RuleEditorStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RuleEditorStateErrorImplCopyWithImpl<$Res>
    extends _$RuleEditorStateCopyWithImpl<$Res, _$RuleEditorStateErrorImpl>
    implements _$$RuleEditorStateErrorImplCopyWith<$Res> {
  __$$RuleEditorStateErrorImplCopyWithImpl(_$RuleEditorStateErrorImpl _value,
      $Res Function(_$RuleEditorStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RuleEditorStateErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RuleEditorStateErrorImpl implements RuleEditorStateError {
  const _$RuleEditorStateErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'RuleEditorState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorStateErrorImplCopyWith<_$RuleEditorStateErrorImpl>
      get copyWith =>
          __$$RuleEditorStateErrorImplCopyWithImpl<_$RuleEditorStateErrorImpl>(
              this, _$identity);
}

abstract class RuleEditorStateError implements RuleEditorState {
  const factory RuleEditorStateError({required final String error}) =
      _$RuleEditorStateErrorImpl;

  String get error;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateErrorImplCopyWith<_$RuleEditorStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_picker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfilePickerEvent {}

/// @nodoc
abstract class $ProfilePickerEventCopyWith<$Res> {
  factory $ProfilePickerEventCopyWith(
    ProfilePickerEvent value,
    $Res Function(ProfilePickerEvent) then,
  ) = _$ProfilePickerEventCopyWithImpl<$Res, ProfilePickerEvent>;
}

/// @nodoc
class _$ProfilePickerEventCopyWithImpl<$Res, $Val extends ProfilePickerEvent>
    implements $ProfilePickerEventCopyWith<$Res> {
  _$ProfilePickerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilePickerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfilePickerEventLoadRequestedImplCopyWith<$Res> {
  factory _$$ProfilePickerEventLoadRequestedImplCopyWith(
    _$ProfilePickerEventLoadRequestedImpl value,
    $Res Function(_$ProfilePickerEventLoadRequestedImpl) then,
  ) = __$$ProfilePickerEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfilePickerEventLoadRequestedImplCopyWithImpl<$Res>
    extends
        _$ProfilePickerEventCopyWithImpl<
          $Res,
          _$ProfilePickerEventLoadRequestedImpl
        >
    implements _$$ProfilePickerEventLoadRequestedImplCopyWith<$Res> {
  __$$ProfilePickerEventLoadRequestedImplCopyWithImpl(
    _$ProfilePickerEventLoadRequestedImpl _value,
    $Res Function(_$ProfilePickerEventLoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfilePickerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfilePickerEventLoadRequestedImpl
    implements ProfilePickerEventLoadRequested {
  const _$ProfilePickerEventLoadRequestedImpl();

  @override
  String toString() {
    return 'ProfilePickerEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePickerEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ProfilePickerEventLoadRequested implements ProfilePickerEvent {
  const factory ProfilePickerEventLoadRequested() =
      _$ProfilePickerEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$ProfilePickerEventSelectedImplCopyWith<$Res> {
  factory _$$ProfilePickerEventSelectedImplCopyWith(
    _$ProfilePickerEventSelectedImpl value,
    $Res Function(_$ProfilePickerEventSelectedImpl) then,
  ) = __$$ProfilePickerEventSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ProfilePickerEventSelectedImplCopyWithImpl<$Res>
    extends
        _$ProfilePickerEventCopyWithImpl<$Res, _$ProfilePickerEventSelectedImpl>
    implements _$$ProfilePickerEventSelectedImplCopyWith<$Res> {
  __$$ProfilePickerEventSelectedImplCopyWithImpl(
    _$ProfilePickerEventSelectedImpl _value,
    $Res Function(_$ProfilePickerEventSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfilePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _$ProfilePickerEventSelectedImpl(
        null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$ProfilePickerEventSelectedImpl implements ProfilePickerEventSelected {
  const _$ProfilePickerEventSelectedImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ProfilePickerEvent.selected(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePickerEventSelectedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ProfilePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePickerEventSelectedImplCopyWith<_$ProfilePickerEventSelectedImpl>
  get copyWith => __$$ProfilePickerEventSelectedImplCopyWithImpl<
    _$ProfilePickerEventSelectedImpl
  >(this, _$identity);
}

abstract class ProfilePickerEventSelected implements ProfilePickerEvent {
  const factory ProfilePickerEventSelected(final int index) =
      _$ProfilePickerEventSelectedImpl;

  int get index;

  /// Create a copy of ProfilePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilePickerEventSelectedImplCopyWith<_$ProfilePickerEventSelectedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfilePickerEventDeselectedImplCopyWith<$Res> {
  factory _$$ProfilePickerEventDeselectedImplCopyWith(
    _$ProfilePickerEventDeselectedImpl value,
    $Res Function(_$ProfilePickerEventDeselectedImpl) then,
  ) = __$$ProfilePickerEventDeselectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ProfilePickerEventDeselectedImplCopyWithImpl<$Res>
    extends
        _$ProfilePickerEventCopyWithImpl<
          $Res,
          _$ProfilePickerEventDeselectedImpl
        >
    implements _$$ProfilePickerEventDeselectedImplCopyWith<$Res> {
  __$$ProfilePickerEventDeselectedImplCopyWithImpl(
    _$ProfilePickerEventDeselectedImpl _value,
    $Res Function(_$ProfilePickerEventDeselectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfilePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _$ProfilePickerEventDeselectedImpl(
        null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$ProfilePickerEventDeselectedImpl
    implements ProfilePickerEventDeselected {
  const _$ProfilePickerEventDeselectedImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ProfilePickerEvent.deselected(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePickerEventDeselectedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ProfilePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePickerEventDeselectedImplCopyWith<
    _$ProfilePickerEventDeselectedImpl
  >
  get copyWith => __$$ProfilePickerEventDeselectedImplCopyWithImpl<
    _$ProfilePickerEventDeselectedImpl
  >(this, _$identity);
}

abstract class ProfilePickerEventDeselected implements ProfilePickerEvent {
  const factory ProfilePickerEventDeselected(final int index) =
      _$ProfilePickerEventDeselectedImpl;

  int get index;

  /// Create a copy of ProfilePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilePickerEventDeselectedImplCopyWith<
    _$ProfilePickerEventDeselectedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfilePickerState {
  List<Profile> get excluded => throw _privateConstructorUsedError;
  StatusOf<List<Profile>> get all => throw _privateConstructorUsedError;
  List<Profile> get selected => throw _privateConstructorUsedError;

  /// Create a copy of ProfilePickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfilePickerStateCopyWith<ProfilePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePickerStateCopyWith<$Res> {
  factory $ProfilePickerStateCopyWith(
    ProfilePickerState value,
    $Res Function(ProfilePickerState) then,
  ) = _$ProfilePickerStateCopyWithImpl<$Res, ProfilePickerState>;
  @useResult
  $Res call({
    List<Profile> excluded,
    StatusOf<List<Profile>> all,
    List<Profile> selected,
  });

  $StatusOfCopyWith<List<Profile>, $Res> get all;
}

/// @nodoc
class _$ProfilePickerStateCopyWithImpl<$Res, $Val extends ProfilePickerState>
    implements $ProfilePickerStateCopyWith<$Res> {
  _$ProfilePickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilePickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? excluded = null,
    Object? all = null,
    Object? selected = null,
  }) {
    return _then(
      _value.copyWith(
            excluded:
                null == excluded
                    ? _value.excluded
                    : excluded // ignore: cast_nullable_to_non_nullable
                        as List<Profile>,
            all:
                null == all
                    ? _value.all
                    : all // ignore: cast_nullable_to_non_nullable
                        as StatusOf<List<Profile>>,
            selected:
                null == selected
                    ? _value.selected
                    : selected // ignore: cast_nullable_to_non_nullable
                        as List<Profile>,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfilePickerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<List<Profile>, $Res> get all {
    return $StatusOfCopyWith<List<Profile>, $Res>(_value.all, (value) {
      return _then(_value.copyWith(all: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfilePickerStateImplCopyWith<$Res>
    implements $ProfilePickerStateCopyWith<$Res> {
  factory _$$ProfilePickerStateImplCopyWith(
    _$ProfilePickerStateImpl value,
    $Res Function(_$ProfilePickerStateImpl) then,
  ) = __$$ProfilePickerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Profile> excluded,
    StatusOf<List<Profile>> all,
    List<Profile> selected,
  });

  @override
  $StatusOfCopyWith<List<Profile>, $Res> get all;
}

/// @nodoc
class __$$ProfilePickerStateImplCopyWithImpl<$Res>
    extends _$ProfilePickerStateCopyWithImpl<$Res, _$ProfilePickerStateImpl>
    implements _$$ProfilePickerStateImplCopyWith<$Res> {
  __$$ProfilePickerStateImplCopyWithImpl(
    _$ProfilePickerStateImpl _value,
    $Res Function(_$ProfilePickerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfilePickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? excluded = null,
    Object? all = null,
    Object? selected = null,
  }) {
    return _then(
      _$ProfilePickerStateImpl(
        excluded:
            null == excluded
                ? _value._excluded
                : excluded // ignore: cast_nullable_to_non_nullable
                    as List<Profile>,
        all:
            null == all
                ? _value.all
                : all // ignore: cast_nullable_to_non_nullable
                    as StatusOf<List<Profile>>,
        selected:
            null == selected
                ? _value._selected
                : selected // ignore: cast_nullable_to_non_nullable
                    as List<Profile>,
      ),
    );
  }
}

/// @nodoc

class _$ProfilePickerStateImpl implements _ProfilePickerState {
  const _$ProfilePickerStateImpl({
    required final List<Profile> excluded,
    this.all = const StatusOfLoading(),
    final List<Profile> selected = const [],
  }) : _excluded = excluded,
       _selected = selected;

  final List<Profile> _excluded;
  @override
  List<Profile> get excluded {
    if (_excluded is EqualUnmodifiableListView) return _excluded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excluded);
  }

  @override
  @JsonKey()
  final StatusOf<List<Profile>> all;
  final List<Profile> _selected;
  @override
  @JsonKey()
  List<Profile> get selected {
    if (_selected is EqualUnmodifiableListView) return _selected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selected);
  }

  @override
  String toString() {
    return 'ProfilePickerState(excluded: $excluded, all: $all, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePickerStateImpl &&
            const DeepCollectionEquality().equals(other._excluded, _excluded) &&
            (identical(other.all, all) || other.all == all) &&
            const DeepCollectionEquality().equals(other._selected, _selected));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_excluded),
    all,
    const DeepCollectionEquality().hash(_selected),
  );

  /// Create a copy of ProfilePickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePickerStateImplCopyWith<_$ProfilePickerStateImpl> get copyWith =>
      __$$ProfilePickerStateImplCopyWithImpl<_$ProfilePickerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ProfilePickerState implements ProfilePickerState {
  const factory _ProfilePickerState({
    required final List<Profile> excluded,
    final StatusOf<List<Profile>> all,
    final List<Profile> selected,
  }) = _$ProfilePickerStateImpl;

  @override
  List<Profile> get excluded;
  @override
  StatusOf<List<Profile>> get all;
  @override
  List<Profile> get selected;

  /// Create a copy of ProfilePickerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilePickerStateImplCopyWith<_$ProfilePickerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

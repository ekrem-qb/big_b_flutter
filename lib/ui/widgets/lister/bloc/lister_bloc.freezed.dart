// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lister_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ListerEvent {}

/// @nodoc
abstract class $ListerEventCopyWith<$Res> {
  factory $ListerEventCopyWith(
    ListerEvent value,
    $Res Function(ListerEvent) then,
  ) = _$ListerEventCopyWithImpl<$Res, ListerEvent>;
}

/// @nodoc
class _$ListerEventCopyWithImpl<$Res, $Val extends ListerEvent>
    implements $ListerEventCopyWith<$Res> {
  _$ListerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ListerEventLoadRequestedImplCopyWith<$Res> {
  factory _$$ListerEventLoadRequestedImplCopyWith(
    _$ListerEventLoadRequestedImpl value,
    $Res Function(_$ListerEventLoadRequestedImpl) then,
  ) = __$$ListerEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ListerEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$ListerEventCopyWithImpl<$Res, _$ListerEventLoadRequestedImpl>
    implements _$$ListerEventLoadRequestedImplCopyWith<$Res> {
  __$$ListerEventLoadRequestedImplCopyWithImpl(
    _$ListerEventLoadRequestedImpl _value,
    $Res Function(_$ListerEventLoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ListerEventLoadRequestedImpl implements ListerEventLoadRequested {
  const _$ListerEventLoadRequestedImpl();

  @override
  String toString() {
    return 'ListerEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListerEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ListerEventLoadRequested implements ListerEvent {
  const factory ListerEventLoadRequested() = _$ListerEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$ListerEventLoadAfterRequestedImplCopyWith<$Res> {
  factory _$$ListerEventLoadAfterRequestedImplCopyWith(
    _$ListerEventLoadAfterRequestedImpl value,
    $Res Function(_$ListerEventLoadAfterRequestedImpl) then,
  ) = __$$ListerEventLoadAfterRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ListerEventLoadAfterRequestedImplCopyWithImpl<$Res>
    extends _$ListerEventCopyWithImpl<$Res, _$ListerEventLoadAfterRequestedImpl>
    implements _$$ListerEventLoadAfterRequestedImplCopyWith<$Res> {
  __$$ListerEventLoadAfterRequestedImplCopyWithImpl(
    _$ListerEventLoadAfterRequestedImpl _value,
    $Res Function(_$ListerEventLoadAfterRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _$ListerEventLoadAfterRequestedImpl(
        null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$ListerEventLoadAfterRequestedImpl
    implements ListerEventLoadAfterRequested {
  const _$ListerEventLoadAfterRequestedImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ListerEvent.loadAfterRequested(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListerEventLoadAfterRequestedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ListerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListerEventLoadAfterRequestedImplCopyWith<
    _$ListerEventLoadAfterRequestedImpl
  >
  get copyWith => __$$ListerEventLoadAfterRequestedImplCopyWithImpl<
    _$ListerEventLoadAfterRequestedImpl
  >(this, _$identity);
}

abstract class ListerEventLoadAfterRequested implements ListerEvent {
  const factory ListerEventLoadAfterRequested(final int index) =
      _$ListerEventLoadAfterRequestedImpl;

  int get index;

  /// Create a copy of ListerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListerEventLoadAfterRequestedImplCopyWith<
    _$ListerEventLoadAfterRequestedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListerEventDataUpdatedImplCopyWith<$Res> {
  factory _$$ListerEventDataUpdatedImplCopyWith(
    _$ListerEventDataUpdatedImpl value,
    $Res Function(_$ListerEventDataUpdatedImpl) then,
  ) = __$$ListerEventDataUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostgresChangePayload payload});
}

/// @nodoc
class __$$ListerEventDataUpdatedImplCopyWithImpl<$Res>
    extends _$ListerEventCopyWithImpl<$Res, _$ListerEventDataUpdatedImpl>
    implements _$$ListerEventDataUpdatedImplCopyWith<$Res> {
  __$$ListerEventDataUpdatedImplCopyWithImpl(
    _$ListerEventDataUpdatedImpl _value,
    $Res Function(_$ListerEventDataUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? payload = null}) {
    return _then(
      _$ListerEventDataUpdatedImpl(
        payload:
            null == payload
                ? _value.payload
                : payload // ignore: cast_nullable_to_non_nullable
                    as PostgresChangePayload,
      ),
    );
  }
}

/// @nodoc

class _$ListerEventDataUpdatedImpl implements _ListerEventDataUpdated {
  const _$ListerEventDataUpdatedImpl({required this.payload});

  @override
  final PostgresChangePayload payload;

  @override
  String toString() {
    return 'ListerEvent.dataUpdated(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListerEventDataUpdatedImpl &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payload);

  /// Create a copy of ListerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListerEventDataUpdatedImplCopyWith<_$ListerEventDataUpdatedImpl>
  get copyWith =>
      __$$ListerEventDataUpdatedImplCopyWithImpl<_$ListerEventDataUpdatedImpl>(
        this,
        _$identity,
      );
}

abstract class _ListerEventDataUpdated implements ListerEvent {
  const factory _ListerEventDataUpdated({
    required final PostgresChangePayload payload,
  }) = _$ListerEventDataUpdatedImpl;

  PostgresChangePayload get payload;

  /// Create a copy of ListerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListerEventDataUpdatedImplCopyWith<_$ListerEventDataUpdatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListerState<T> {
  int get totalCount => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;

  /// Create a copy of ListerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListerStateCopyWith<T, ListerState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListerStateCopyWith<T, $Res> {
  factory $ListerStateCopyWith(
    ListerState<T> value,
    $Res Function(ListerState<T>) then,
  ) = _$ListerStateCopyWithImpl<T, $Res, ListerState<T>>;
  @useResult
  $Res call({int totalCount, List<T> items});
}

/// @nodoc
class _$ListerStateCopyWithImpl<T, $Res, $Val extends ListerState<T>>
    implements $ListerStateCopyWith<T, $Res> {
  _$ListerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? totalCount = null, Object? items = null}) {
    return _then(
      _value.copyWith(
            totalCount:
                null == totalCount
                    ? _value.totalCount
                    : totalCount // ignore: cast_nullable_to_non_nullable
                        as int,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<T>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ListerStateImplCopyWith<T, $Res>
    implements $ListerStateCopyWith<T, $Res> {
  factory _$$ListerStateImplCopyWith(
    _$ListerStateImpl<T> value,
    $Res Function(_$ListerStateImpl<T>) then,
  ) = __$$ListerStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int totalCount, List<T> items});
}

/// @nodoc
class __$$ListerStateImplCopyWithImpl<T, $Res>
    extends _$ListerStateCopyWithImpl<T, $Res, _$ListerStateImpl<T>>
    implements _$$ListerStateImplCopyWith<T, $Res> {
  __$$ListerStateImplCopyWithImpl(
    _$ListerStateImpl<T> _value,
    $Res Function(_$ListerStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ListerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? totalCount = null, Object? items = null}) {
    return _then(
      _$ListerStateImpl<T>(
        totalCount:
            null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                    as int,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$ListerStateImpl<T> implements _ListerState<T> {
  const _$ListerStateImpl({
    required this.totalCount,
    required final List<T> items,
  }) : _items = items;

  @override
  final int totalCount;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ListerState<$T>(totalCount: $totalCount, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListerStateImpl<T> &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalCount,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of ListerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListerStateImplCopyWith<T, _$ListerStateImpl<T>> get copyWith =>
      __$$ListerStateImplCopyWithImpl<T, _$ListerStateImpl<T>>(
        this,
        _$identity,
      );
}

abstract class _ListerState<T> implements ListerState<T> {
  const factory _ListerState({
    required final int totalCount,
    required final List<T> items,
  }) = _$ListerStateImpl<T>;

  @override
  int get totalCount;
  @override
  List<T> get items;

  /// Create a copy of ListerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListerStateImplCopyWith<T, _$ListerStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

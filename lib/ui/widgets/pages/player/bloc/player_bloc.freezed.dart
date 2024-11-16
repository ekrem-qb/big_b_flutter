// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlayerEvent {}

/// @nodoc
abstract class $PlayerEventCopyWith<$Res> {
  factory $PlayerEventCopyWith(
          PlayerEvent value, $Res Function(PlayerEvent) then) =
      _$PlayerEventCopyWithImpl<$Res, PlayerEvent>;
}

/// @nodoc
class _$PlayerEventCopyWithImpl<$Res, $Val extends PlayerEvent>
    implements $PlayerEventCopyWith<$Res> {
  _$PlayerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PlayerEventLoadRequestedImplCopyWith<$Res> {
  factory _$$PlayerEventLoadRequestedImplCopyWith(
          _$PlayerEventLoadRequestedImpl value,
          $Res Function(_$PlayerEventLoadRequestedImpl) then) =
      __$$PlayerEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventLoadRequestedImpl>
    implements _$$PlayerEventLoadRequestedImplCopyWith<$Res> {
  __$$PlayerEventLoadRequestedImplCopyWithImpl(
      _$PlayerEventLoadRequestedImpl _value,
      $Res Function(_$PlayerEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayerEventLoadRequestedImpl
    with DiagnosticableTreeMixin
    implements PlayerEventLoadRequested {
  const _$PlayerEventLoadRequestedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.loadRequested()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PlayerEvent.loadRequested'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PlayerEventLoadRequested implements PlayerEvent {
  const factory PlayerEventLoadRequested() = _$PlayerEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$PlayerEventAudioLoadRequestedImplCopyWith<$Res> {
  factory _$$PlayerEventAudioLoadRequestedImplCopyWith(
          _$PlayerEventAudioLoadRequestedImpl value,
          $Res Function(_$PlayerEventAudioLoadRequestedImpl) then) =
      __$$PlayerEventAudioLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerEventAudioLoadRequestedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventAudioLoadRequestedImpl>
    implements _$$PlayerEventAudioLoadRequestedImplCopyWith<$Res> {
  __$$PlayerEventAudioLoadRequestedImplCopyWithImpl(
      _$PlayerEventAudioLoadRequestedImpl _value,
      $Res Function(_$PlayerEventAudioLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayerEventAudioLoadRequestedImpl
    with DiagnosticableTreeMixin
    implements PlayerEventAudioLoadRequested {
  const _$PlayerEventAudioLoadRequestedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.audioLoadRequested()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'PlayerEvent.audioLoadRequested'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventAudioLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PlayerEventAudioLoadRequested implements PlayerEvent {
  const factory PlayerEventAudioLoadRequested() =
      _$PlayerEventAudioLoadRequestedImpl;
}

/// @nodoc
abstract class _$$PlayerEventTextLoadRequestedImplCopyWith<$Res> {
  factory _$$PlayerEventTextLoadRequestedImplCopyWith(
          _$PlayerEventTextLoadRequestedImpl value,
          $Res Function(_$PlayerEventTextLoadRequestedImpl) then) =
      __$$PlayerEventTextLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerEventTextLoadRequestedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventTextLoadRequestedImpl>
    implements _$$PlayerEventTextLoadRequestedImplCopyWith<$Res> {
  __$$PlayerEventTextLoadRequestedImplCopyWithImpl(
      _$PlayerEventTextLoadRequestedImpl _value,
      $Res Function(_$PlayerEventTextLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayerEventTextLoadRequestedImpl
    with DiagnosticableTreeMixin
    implements PlayerEventTextLoadRequested {
  const _$PlayerEventTextLoadRequestedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.textLoadRequested()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'PlayerEvent.textLoadRequested'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventTextLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PlayerEventTextLoadRequested implements PlayerEvent {
  const factory PlayerEventTextLoadRequested() =
      _$PlayerEventTextLoadRequestedImpl;
}

/// @nodoc
abstract class _$$PlayerEventDurationChangedImplCopyWith<$Res> {
  factory _$$PlayerEventDurationChangedImplCopyWith(
          _$PlayerEventDurationChangedImpl value,
          $Res Function(_$PlayerEventDurationChangedImpl) then) =
      __$$PlayerEventDurationChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration duration});
}

/// @nodoc
class __$$PlayerEventDurationChangedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventDurationChangedImpl>
    implements _$$PlayerEventDurationChangedImplCopyWith<$Res> {
  __$$PlayerEventDurationChangedImplCopyWithImpl(
      _$PlayerEventDurationChangedImpl _value,
      $Res Function(_$PlayerEventDurationChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
  }) {
    return _then(_$PlayerEventDurationChangedImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$PlayerEventDurationChangedImpl
    with DiagnosticableTreeMixin
    implements _PlayerEventDurationChanged {
  const _$PlayerEventDurationChangedImpl({required this.duration});

  @override
  final Duration duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.durationChanged(duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerEvent.durationChanged'))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventDurationChangedImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEventDurationChangedImplCopyWith<_$PlayerEventDurationChangedImpl>
      get copyWith => __$$PlayerEventDurationChangedImplCopyWithImpl<
          _$PlayerEventDurationChangedImpl>(this, _$identity);
}

abstract class _PlayerEventDurationChanged implements PlayerEvent {
  const factory _PlayerEventDurationChanged(
      {required final Duration duration}) = _$PlayerEventDurationChangedImpl;

  Duration get duration;

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerEventDurationChangedImplCopyWith<_$PlayerEventDurationChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerEventPlayingChangedImplCopyWith<$Res> {
  factory _$$PlayerEventPlayingChangedImplCopyWith(
          _$PlayerEventPlayingChangedImpl value,
          $Res Function(_$PlayerEventPlayingChangedImpl) then) =
      __$$PlayerEventPlayingChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isPlaying});
}

/// @nodoc
class __$$PlayerEventPlayingChangedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventPlayingChangedImpl>
    implements _$$PlayerEventPlayingChangedImplCopyWith<$Res> {
  __$$PlayerEventPlayingChangedImplCopyWithImpl(
      _$PlayerEventPlayingChangedImpl _value,
      $Res Function(_$PlayerEventPlayingChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
  }) {
    return _then(_$PlayerEventPlayingChangedImpl(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlayerEventPlayingChangedImpl
    with DiagnosticableTreeMixin
    implements _PlayerEventPlayingChanged {
  const _$PlayerEventPlayingChangedImpl({required this.isPlaying});

  @override
  final bool isPlaying;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.playingChanged(isPlaying: $isPlaying)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerEvent.playingChanged'))
      ..add(DiagnosticsProperty('isPlaying', isPlaying));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventPlayingChangedImpl &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPlaying);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEventPlayingChangedImplCopyWith<_$PlayerEventPlayingChangedImpl>
      get copyWith => __$$PlayerEventPlayingChangedImplCopyWithImpl<
          _$PlayerEventPlayingChangedImpl>(this, _$identity);
}

abstract class _PlayerEventPlayingChanged implements PlayerEvent {
  const factory _PlayerEventPlayingChanged({required final bool isPlaying}) =
      _$PlayerEventPlayingChangedImpl;

  bool get isPlaying;

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerEventPlayingChangedImplCopyWith<_$PlayerEventPlayingChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerEventErrorImplCopyWith<$Res> {
  factory _$$PlayerEventErrorImplCopyWith(_$PlayerEventErrorImpl value,
          $Res Function(_$PlayerEventErrorImpl) then) =
      __$$PlayerEventErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PlayerEventErrorImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventErrorImpl>
    implements _$$PlayerEventErrorImplCopyWith<$Res> {
  __$$PlayerEventErrorImplCopyWithImpl(_$PlayerEventErrorImpl _value,
      $Res Function(_$PlayerEventErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PlayerEventErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlayerEventErrorImpl
    with DiagnosticableTreeMixin
    implements _PlayerEventError {
  const _$PlayerEventErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerEvent.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEventErrorImplCopyWith<_$PlayerEventErrorImpl> get copyWith =>
      __$$PlayerEventErrorImplCopyWithImpl<_$PlayerEventErrorImpl>(
          this, _$identity);
}

abstract class _PlayerEventError implements PlayerEvent {
  const factory _PlayerEventError({required final String error}) =
      _$PlayerEventErrorImpl;

  String get error;

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerEventErrorImplCopyWith<_$PlayerEventErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerEventPositionChangedImplCopyWith<$Res> {
  factory _$$PlayerEventPositionChangedImplCopyWith(
          _$PlayerEventPositionChangedImpl value,
          $Res Function(_$PlayerEventPositionChangedImpl) then) =
      __$$PlayerEventPositionChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration position});
}

/// @nodoc
class __$$PlayerEventPositionChangedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventPositionChangedImpl>
    implements _$$PlayerEventPositionChangedImplCopyWith<$Res> {
  __$$PlayerEventPositionChangedImplCopyWithImpl(
      _$PlayerEventPositionChangedImpl _value,
      $Res Function(_$PlayerEventPositionChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$PlayerEventPositionChangedImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$PlayerEventPositionChangedImpl
    with DiagnosticableTreeMixin
    implements _PlayerEventPositionChanged {
  const _$PlayerEventPositionChangedImpl({required this.position});

  @override
  final Duration position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.positionChanged(position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerEvent.positionChanged'))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventPositionChangedImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEventPositionChangedImplCopyWith<_$PlayerEventPositionChangedImpl>
      get copyWith => __$$PlayerEventPositionChangedImplCopyWithImpl<
          _$PlayerEventPositionChangedImpl>(this, _$identity);
}

abstract class _PlayerEventPositionChanged implements PlayerEvent {
  const factory _PlayerEventPositionChanged(
      {required final Duration position}) = _$PlayerEventPositionChangedImpl;

  Duration get position;

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerEventPositionChangedImplCopyWith<_$PlayerEventPositionChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerEventJumpToLineRequestedImplCopyWith<$Res> {
  factory _$$PlayerEventJumpToLineRequestedImplCopyWith(
          _$PlayerEventJumpToLineRequestedImpl value,
          $Res Function(_$PlayerEventJumpToLineRequestedImpl) then) =
      __$$PlayerEventJumpToLineRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, bool seekPlayer});
}

/// @nodoc
class __$$PlayerEventJumpToLineRequestedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res,
        _$PlayerEventJumpToLineRequestedImpl>
    implements _$$PlayerEventJumpToLineRequestedImplCopyWith<$Res> {
  __$$PlayerEventJumpToLineRequestedImplCopyWithImpl(
      _$PlayerEventJumpToLineRequestedImpl _value,
      $Res Function(_$PlayerEventJumpToLineRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? seekPlayer = null,
  }) {
    return _then(_$PlayerEventJumpToLineRequestedImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      seekPlayer: null == seekPlayer
          ? _value.seekPlayer
          : seekPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlayerEventJumpToLineRequestedImpl
    with DiagnosticableTreeMixin
    implements PlayerEventJumpToLineRequested {
  const _$PlayerEventJumpToLineRequestedImpl(this.index,
      {this.seekPlayer = true});

  @override
  final int index;
  @override
  @JsonKey()
  final bool seekPlayer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.jumpToLineRequested(index: $index, seekPlayer: $seekPlayer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerEvent.jumpToLineRequested'))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('seekPlayer', seekPlayer));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventJumpToLineRequestedImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.seekPlayer, seekPlayer) ||
                other.seekPlayer == seekPlayer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, seekPlayer);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEventJumpToLineRequestedImplCopyWith<
          _$PlayerEventJumpToLineRequestedImpl>
      get copyWith => __$$PlayerEventJumpToLineRequestedImplCopyWithImpl<
          _$PlayerEventJumpToLineRequestedImpl>(this, _$identity);
}

abstract class PlayerEventJumpToLineRequested implements PlayerEvent {
  const factory PlayerEventJumpToLineRequested(final int index,
      {final bool seekPlayer}) = _$PlayerEventJumpToLineRequestedImpl;

  int get index;
  bool get seekPlayer;

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerEventJumpToLineRequestedImplCopyWith<
          _$PlayerEventJumpToLineRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerEventSeekRequestedImplCopyWith<$Res> {
  factory _$$PlayerEventSeekRequestedImplCopyWith(
          _$PlayerEventSeekRequestedImpl value,
          $Res Function(_$PlayerEventSeekRequestedImpl) then) =
      __$$PlayerEventSeekRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration position});
}

/// @nodoc
class __$$PlayerEventSeekRequestedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventSeekRequestedImpl>
    implements _$$PlayerEventSeekRequestedImplCopyWith<$Res> {
  __$$PlayerEventSeekRequestedImplCopyWithImpl(
      _$PlayerEventSeekRequestedImpl _value,
      $Res Function(_$PlayerEventSeekRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$PlayerEventSeekRequestedImpl(
      null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$PlayerEventSeekRequestedImpl
    with DiagnosticableTreeMixin
    implements PlayerEventSeekRequested {
  const _$PlayerEventSeekRequestedImpl(this.position);

  @override
  final Duration position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.seekRequested(position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerEvent.seekRequested'))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventSeekRequestedImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEventSeekRequestedImplCopyWith<_$PlayerEventSeekRequestedImpl>
      get copyWith => __$$PlayerEventSeekRequestedImplCopyWithImpl<
          _$PlayerEventSeekRequestedImpl>(this, _$identity);
}

abstract class PlayerEventSeekRequested implements PlayerEvent {
  const factory PlayerEventSeekRequested(final Duration position) =
      _$PlayerEventSeekRequestedImpl;

  Duration get position;

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerEventSeekRequestedImplCopyWith<_$PlayerEventSeekRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerEventPlayPauseButtonPressedImplCopyWith<$Res> {
  factory _$$PlayerEventPlayPauseButtonPressedImplCopyWith(
          _$PlayerEventPlayPauseButtonPressedImpl value,
          $Res Function(_$PlayerEventPlayPauseButtonPressedImpl) then) =
      __$$PlayerEventPlayPauseButtonPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerEventPlayPauseButtonPressedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res,
        _$PlayerEventPlayPauseButtonPressedImpl>
    implements _$$PlayerEventPlayPauseButtonPressedImplCopyWith<$Res> {
  __$$PlayerEventPlayPauseButtonPressedImplCopyWithImpl(
      _$PlayerEventPlayPauseButtonPressedImpl _value,
      $Res Function(_$PlayerEventPlayPauseButtonPressedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayerEventPlayPauseButtonPressedImpl
    with DiagnosticableTreeMixin
    implements PlayerEventPlayPauseButtonPressed {
  const _$PlayerEventPlayPauseButtonPressedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.playPauseButtonPressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'PlayerEvent.playPauseButtonPressed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventPlayPauseButtonPressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PlayerEventPlayPauseButtonPressed implements PlayerEvent {
  const factory PlayerEventPlayPauseButtonPressed() =
      _$PlayerEventPlayPauseButtonPressedImpl;
}

/// @nodoc
mixin _$PlayerState {
  int get recordingId => throw _privateConstructorUsedError;
  int? get currentTextLineId => throw _privateConstructorUsedError;
  StatusOf<Recording> get recordingState => throw _privateConstructorUsedError;
  StatusOf<PlayerAudioState> get audioState =>
      throw _privateConstructorUsedError;
  StatusOf<PlayerTextState> get textState => throw _privateConstructorUsedError;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res, PlayerState>;
  @useResult
  $Res call(
      {int recordingId,
      int? currentTextLineId,
      StatusOf<Recording> recordingState,
      StatusOf<PlayerAudioState> audioState,
      StatusOf<PlayerTextState> textState});

  $StatusOfCopyWith<Recording, $Res> get recordingState;
  $StatusOfCopyWith<PlayerAudioState, $Res> get audioState;
  $StatusOfCopyWith<PlayerTextState, $Res> get textState;
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res, $Val extends PlayerState>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordingId = null,
    Object? currentTextLineId = freezed,
    Object? recordingState = null,
    Object? audioState = null,
    Object? textState = null,
  }) {
    return _then(_value.copyWith(
      recordingId: null == recordingId
          ? _value.recordingId
          : recordingId // ignore: cast_nullable_to_non_nullable
              as int,
      currentTextLineId: freezed == currentTextLineId
          ? _value.currentTextLineId
          : currentTextLineId // ignore: cast_nullable_to_non_nullable
              as int?,
      recordingState: null == recordingState
          ? _value.recordingState
          : recordingState // ignore: cast_nullable_to_non_nullable
              as StatusOf<Recording>,
      audioState: null == audioState
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as StatusOf<PlayerAudioState>,
      textState: null == textState
          ? _value.textState
          : textState // ignore: cast_nullable_to_non_nullable
              as StatusOf<PlayerTextState>,
    ) as $Val);
  }

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<Recording, $Res> get recordingState {
    return $StatusOfCopyWith<Recording, $Res>(_value.recordingState, (value) {
      return _then(_value.copyWith(recordingState: value) as $Val);
    });
  }

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<PlayerAudioState, $Res> get audioState {
    return $StatusOfCopyWith<PlayerAudioState, $Res>(_value.audioState,
        (value) {
      return _then(_value.copyWith(audioState: value) as $Val);
    });
  }

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<PlayerTextState, $Res> get textState {
    return $StatusOfCopyWith<PlayerTextState, $Res>(_value.textState, (value) {
      return _then(_value.copyWith(textState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerStateImplCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$$PlayerStateImplCopyWith(
          _$PlayerStateImpl value, $Res Function(_$PlayerStateImpl) then) =
      __$$PlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int recordingId,
      int? currentTextLineId,
      StatusOf<Recording> recordingState,
      StatusOf<PlayerAudioState> audioState,
      StatusOf<PlayerTextState> textState});

  @override
  $StatusOfCopyWith<Recording, $Res> get recordingState;
  @override
  $StatusOfCopyWith<PlayerAudioState, $Res> get audioState;
  @override
  $StatusOfCopyWith<PlayerTextState, $Res> get textState;
}

/// @nodoc
class __$$PlayerStateImplCopyWithImpl<$Res>
    extends _$PlayerStateCopyWithImpl<$Res, _$PlayerStateImpl>
    implements _$$PlayerStateImplCopyWith<$Res> {
  __$$PlayerStateImplCopyWithImpl(
      _$PlayerStateImpl _value, $Res Function(_$PlayerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordingId = null,
    Object? currentTextLineId = freezed,
    Object? recordingState = null,
    Object? audioState = null,
    Object? textState = null,
  }) {
    return _then(_$PlayerStateImpl(
      recordingId: null == recordingId
          ? _value.recordingId
          : recordingId // ignore: cast_nullable_to_non_nullable
              as int,
      currentTextLineId: freezed == currentTextLineId
          ? _value.currentTextLineId
          : currentTextLineId // ignore: cast_nullable_to_non_nullable
              as int?,
      recordingState: null == recordingState
          ? _value.recordingState
          : recordingState // ignore: cast_nullable_to_non_nullable
              as StatusOf<Recording>,
      audioState: null == audioState
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as StatusOf<PlayerAudioState>,
      textState: null == textState
          ? _value.textState
          : textState // ignore: cast_nullable_to_non_nullable
              as StatusOf<PlayerTextState>,
    ));
  }
}

/// @nodoc

class _$PlayerStateImpl with DiagnosticableTreeMixin implements _PlayerState {
  const _$PlayerStateImpl(
      {required this.recordingId,
      this.currentTextLineId,
      this.recordingState = const StatusOfLoading(),
      this.audioState = const StatusOfLoading(),
      this.textState = const StatusOfLoading()});

  @override
  final int recordingId;
  @override
  final int? currentTextLineId;
  @override
  @JsonKey()
  final StatusOf<Recording> recordingState;
  @override
  @JsonKey()
  final StatusOf<PlayerAudioState> audioState;
  @override
  @JsonKey()
  final StatusOf<PlayerTextState> textState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerState(recordingId: $recordingId, currentTextLineId: $currentTextLineId, recordingState: $recordingState, audioState: $audioState, textState: $textState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerState'))
      ..add(DiagnosticsProperty('recordingId', recordingId))
      ..add(DiagnosticsProperty('currentTextLineId', currentTextLineId))
      ..add(DiagnosticsProperty('recordingState', recordingState))
      ..add(DiagnosticsProperty('audioState', audioState))
      ..add(DiagnosticsProperty('textState', textState));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStateImpl &&
            (identical(other.recordingId, recordingId) ||
                other.recordingId == recordingId) &&
            (identical(other.currentTextLineId, currentTextLineId) ||
                other.currentTextLineId == currentTextLineId) &&
            (identical(other.recordingState, recordingState) ||
                other.recordingState == recordingState) &&
            (identical(other.audioState, audioState) ||
                other.audioState == audioState) &&
            (identical(other.textState, textState) ||
                other.textState == textState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recordingId, currentTextLineId,
      recordingState, audioState, textState);

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      __$$PlayerStateImplCopyWithImpl<_$PlayerStateImpl>(this, _$identity);
}

abstract class _PlayerState implements PlayerState {
  const factory _PlayerState(
      {required final int recordingId,
      final int? currentTextLineId,
      final StatusOf<Recording> recordingState,
      final StatusOf<PlayerAudioState> audioState,
      final StatusOf<PlayerTextState> textState}) = _$PlayerStateImpl;

  @override
  int get recordingId;
  @override
  int? get currentTextLineId;
  @override
  StatusOf<Recording> get recordingState;
  @override
  StatusOf<PlayerAudioState> get audioState;
  @override
  StatusOf<PlayerTextState> get textState;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlayerAudioState {
  Duration get position => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerAudioStateCopyWith<PlayerAudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerAudioStateCopyWith<$Res> {
  factory $PlayerAudioStateCopyWith(
          PlayerAudioState value, $Res Function(PlayerAudioState) then) =
      _$PlayerAudioStateCopyWithImpl<$Res, PlayerAudioState>;
  @useResult
  $Res call({Duration position, Duration duration, bool isPlaying});
}

/// @nodoc
class _$PlayerAudioStateCopyWithImpl<$Res, $Val extends PlayerAudioState>
    implements $PlayerAudioStateCopyWith<$Res> {
  _$PlayerAudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
    Object? isPlaying = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerAudioStateImplCopyWith<$Res>
    implements $PlayerAudioStateCopyWith<$Res> {
  factory _$$PlayerAudioStateImplCopyWith(_$PlayerAudioStateImpl value,
          $Res Function(_$PlayerAudioStateImpl) then) =
      __$$PlayerAudioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration position, Duration duration, bool isPlaying});
}

/// @nodoc
class __$$PlayerAudioStateImplCopyWithImpl<$Res>
    extends _$PlayerAudioStateCopyWithImpl<$Res, _$PlayerAudioStateImpl>
    implements _$$PlayerAudioStateImplCopyWith<$Res> {
  __$$PlayerAudioStateImplCopyWithImpl(_$PlayerAudioStateImpl _value,
      $Res Function(_$PlayerAudioStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
    Object? isPlaying = null,
  }) {
    return _then(_$PlayerAudioStateImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlayerAudioStateImpl
    with DiagnosticableTreeMixin
    implements _PlayerAudioState {
  const _$PlayerAudioStateImpl(
      {this.position = Duration.zero,
      this.duration = const Duration(seconds: 1),
      this.isPlaying = false});

  @override
  @JsonKey()
  final Duration position;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final bool isPlaying;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerAudioState(position: $position, duration: $duration, isPlaying: $isPlaying)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerAudioState'))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('isPlaying', isPlaying));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerAudioStateImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, duration, isPlaying);

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerAudioStateImplCopyWith<_$PlayerAudioStateImpl> get copyWith =>
      __$$PlayerAudioStateImplCopyWithImpl<_$PlayerAudioStateImpl>(
          this, _$identity);
}

abstract class _PlayerAudioState implements PlayerAudioState {
  const factory _PlayerAudioState(
      {final Duration position,
      final Duration duration,
      final bool isPlaying}) = _$PlayerAudioStateImpl;

  @override
  Duration get position;
  @override
  Duration get duration;
  @override
  bool get isPlaying;

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerAudioStateImplCopyWith<_$PlayerAudioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlayerTextState {}

/// @nodoc
abstract class $PlayerTextStateCopyWith<$Res> {
  factory $PlayerTextStateCopyWith(
          PlayerTextState value, $Res Function(PlayerTextState) then) =
      _$PlayerTextStateCopyWithImpl<$Res, PlayerTextState>;
}

/// @nodoc
class _$PlayerTextStateCopyWithImpl<$Res, $Val extends PlayerTextState>
    implements $PlayerTextStateCopyWith<$Res> {
  _$PlayerTextStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PlayerTextStateNoneImplCopyWith<$Res> {
  factory _$$PlayerTextStateNoneImplCopyWith(_$PlayerTextStateNoneImpl value,
          $Res Function(_$PlayerTextStateNoneImpl) then) =
      __$$PlayerTextStateNoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerTextStateNoneImplCopyWithImpl<$Res>
    extends _$PlayerTextStateCopyWithImpl<$Res, _$PlayerTextStateNoneImpl>
    implements _$$PlayerTextStateNoneImplCopyWith<$Res> {
  __$$PlayerTextStateNoneImplCopyWithImpl(_$PlayerTextStateNoneImpl _value,
      $Res Function(_$PlayerTextStateNoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayerTextStateNoneImpl
    with DiagnosticableTreeMixin
    implements PlayerTextStateNone {
  const _$PlayerTextStateNoneImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerTextState.none()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PlayerTextState.none'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerTextStateNoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PlayerTextStateNone implements PlayerTextState {
  const factory PlayerTextStateNone() = _$PlayerTextStateNoneImpl;
}

/// @nodoc
abstract class _$$PlayerTextStateOnlyTextImplCopyWith<$Res> {
  factory _$$PlayerTextStateOnlyTextImplCopyWith(
          _$PlayerTextStateOnlyTextImpl value,
          $Res Function(_$PlayerTextStateOnlyTextImpl) then) =
      __$$PlayerTextStateOnlyTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int currentTextLine, List<TextLine> textLines});
}

/// @nodoc
class __$$PlayerTextStateOnlyTextImplCopyWithImpl<$Res>
    extends _$PlayerTextStateCopyWithImpl<$Res, _$PlayerTextStateOnlyTextImpl>
    implements _$$PlayerTextStateOnlyTextImplCopyWith<$Res> {
  __$$PlayerTextStateOnlyTextImplCopyWithImpl(
      _$PlayerTextStateOnlyTextImpl _value,
      $Res Function(_$PlayerTextStateOnlyTextImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTextLine = null,
    Object? textLines = null,
  }) {
    return _then(_$PlayerTextStateOnlyTextImpl(
      currentTextLine: null == currentTextLine
          ? _value.currentTextLine
          : currentTextLine // ignore: cast_nullable_to_non_nullable
              as int,
      textLines: null == textLines
          ? _value._textLines
          : textLines // ignore: cast_nullable_to_non_nullable
              as List<TextLine>,
    ));
  }
}

/// @nodoc

class _$PlayerTextStateOnlyTextImpl
    with DiagnosticableTreeMixin
    implements PlayerTextStateOnlyText {
  const _$PlayerTextStateOnlyTextImpl(
      {this.currentTextLine = 0, final List<TextLine> textLines = const []})
      : _textLines = textLines;

  @override
  @JsonKey()
  final int currentTextLine;
  final List<TextLine> _textLines;
  @override
  @JsonKey()
  List<TextLine> get textLines {
    if (_textLines is EqualUnmodifiableListView) return _textLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textLines);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerTextState.onlyText(currentTextLine: $currentTextLine, textLines: $textLines)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerTextState.onlyText'))
      ..add(DiagnosticsProperty('currentTextLine', currentTextLine))
      ..add(DiagnosticsProperty('textLines', textLines));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerTextStateOnlyTextImpl &&
            (identical(other.currentTextLine, currentTextLine) ||
                other.currentTextLine == currentTextLine) &&
            const DeepCollectionEquality()
                .equals(other._textLines, _textLines));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentTextLine,
      const DeepCollectionEquality().hash(_textLines));

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerTextStateOnlyTextImplCopyWith<_$PlayerTextStateOnlyTextImpl>
      get copyWith => __$$PlayerTextStateOnlyTextImplCopyWithImpl<
          _$PlayerTextStateOnlyTextImpl>(this, _$identity);
}

abstract class PlayerTextStateOnlyText implements PlayerTextState {
  const factory PlayerTextStateOnlyText(
      {final int currentTextLine,
      final List<TextLine> textLines}) = _$PlayerTextStateOnlyTextImpl;

  int get currentTextLine;
  List<TextLine> get textLines;

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerTextStateOnlyTextImplCopyWith<_$PlayerTextStateOnlyTextImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerTextStateTextAndViolationsImplCopyWith<$Res> {
  factory _$$PlayerTextStateTextAndViolationsImplCopyWith(
          _$PlayerTextStateTextAndViolationsImpl value,
          $Res Function(_$PlayerTextStateTextAndViolationsImpl) then) =
      __$$PlayerTextStateTextAndViolationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int currentTextLine,
      List<TextLine> textLines,
      List<List<HighlightViolation>> highlights,
      StatusOf<List<Violation>> violations});

  $StatusOfCopyWith<List<Violation>, $Res> get violations;
}

/// @nodoc
class __$$PlayerTextStateTextAndViolationsImplCopyWithImpl<$Res>
    extends _$PlayerTextStateCopyWithImpl<$Res,
        _$PlayerTextStateTextAndViolationsImpl>
    implements _$$PlayerTextStateTextAndViolationsImplCopyWith<$Res> {
  __$$PlayerTextStateTextAndViolationsImplCopyWithImpl(
      _$PlayerTextStateTextAndViolationsImpl _value,
      $Res Function(_$PlayerTextStateTextAndViolationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTextLine = null,
    Object? textLines = null,
    Object? highlights = null,
    Object? violations = null,
  }) {
    return _then(_$PlayerTextStateTextAndViolationsImpl(
      currentTextLine: null == currentTextLine
          ? _value.currentTextLine
          : currentTextLine // ignore: cast_nullable_to_non_nullable
              as int,
      textLines: null == textLines
          ? _value._textLines
          : textLines // ignore: cast_nullable_to_non_nullable
              as List<TextLine>,
      highlights: null == highlights
          ? _value._highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<List<HighlightViolation>>,
      violations: null == violations
          ? _value.violations
          : violations // ignore: cast_nullable_to_non_nullable
              as StatusOf<List<Violation>>,
    ));
  }

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<List<Violation>, $Res> get violations {
    return $StatusOfCopyWith<List<Violation>, $Res>(_value.violations, (value) {
      return _then(_value.copyWith(violations: value));
    });
  }
}

/// @nodoc

class _$PlayerTextStateTextAndViolationsImpl
    with DiagnosticableTreeMixin
    implements PlayerTextStateTextAndViolations {
  const _$PlayerTextStateTextAndViolationsImpl(
      {this.currentTextLine = 0,
      final List<TextLine> textLines = const [],
      final List<List<HighlightViolation>> highlights = const [],
      this.violations = const StatusOfLoading()})
      : _textLines = textLines,
        _highlights = highlights;

  @override
  @JsonKey()
  final int currentTextLine;
  final List<TextLine> _textLines;
  @override
  @JsonKey()
  List<TextLine> get textLines {
    if (_textLines is EqualUnmodifiableListView) return _textLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textLines);
  }

  final List<List<HighlightViolation>> _highlights;
  @override
  @JsonKey()
  List<List<HighlightViolation>> get highlights {
    if (_highlights is EqualUnmodifiableListView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlights);
  }

  @override
  @JsonKey()
  final StatusOf<List<Violation>> violations;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerTextState.textAndViolations(currentTextLine: $currentTextLine, textLines: $textLines, highlights: $highlights, violations: $violations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerTextState.textAndViolations'))
      ..add(DiagnosticsProperty('currentTextLine', currentTextLine))
      ..add(DiagnosticsProperty('textLines', textLines))
      ..add(DiagnosticsProperty('highlights', highlights))
      ..add(DiagnosticsProperty('violations', violations));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerTextStateTextAndViolationsImpl &&
            (identical(other.currentTextLine, currentTextLine) ||
                other.currentTextLine == currentTextLine) &&
            const DeepCollectionEquality()
                .equals(other._textLines, _textLines) &&
            const DeepCollectionEquality()
                .equals(other._highlights, _highlights) &&
            (identical(other.violations, violations) ||
                other.violations == violations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTextLine,
      const DeepCollectionEquality().hash(_textLines),
      const DeepCollectionEquality().hash(_highlights),
      violations);

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerTextStateTextAndViolationsImplCopyWith<
          _$PlayerTextStateTextAndViolationsImpl>
      get copyWith => __$$PlayerTextStateTextAndViolationsImplCopyWithImpl<
          _$PlayerTextStateTextAndViolationsImpl>(this, _$identity);
}

abstract class PlayerTextStateTextAndViolations implements PlayerTextState {
  const factory PlayerTextStateTextAndViolations(
          {final int currentTextLine,
          final List<TextLine> textLines,
          final List<List<HighlightViolation>> highlights,
          final StatusOf<List<Violation>> violations}) =
      _$PlayerTextStateTextAndViolationsImpl;

  int get currentTextLine;
  List<TextLine> get textLines;
  List<List<HighlightViolation>> get highlights;
  StatusOf<List<Violation>> get violations;

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerTextStateTextAndViolationsImplCopyWith<
          _$PlayerTextStateTextAndViolationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

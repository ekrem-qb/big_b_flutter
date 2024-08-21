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
    implements _PlayerEventLoadRequested {
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

abstract class _PlayerEventLoadRequested implements PlayerEvent {
  const factory _PlayerEventLoadRequested() = _$PlayerEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$PlayerEventRecordingLoadedImplCopyWith<$Res> {
  factory _$$PlayerEventRecordingLoadedImplCopyWith(
          _$PlayerEventRecordingLoadedImpl value,
          $Res Function(_$PlayerEventRecordingLoadedImpl) then) =
      __$$PlayerEventRecordingLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Recording recording});

  $RecordingCopyWith<$Res> get recording;
}

/// @nodoc
class __$$PlayerEventRecordingLoadedImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventRecordingLoadedImpl>
    implements _$$PlayerEventRecordingLoadedImplCopyWith<$Res> {
  __$$PlayerEventRecordingLoadedImplCopyWithImpl(
      _$PlayerEventRecordingLoadedImpl _value,
      $Res Function(_$PlayerEventRecordingLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recording = null,
  }) {
    return _then(_$PlayerEventRecordingLoadedImpl(
      recording: null == recording
          ? _value.recording
          : recording // ignore: cast_nullable_to_non_nullable
              as Recording,
    ));
  }

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecordingCopyWith<$Res> get recording {
    return $RecordingCopyWith<$Res>(_value.recording, (value) {
      return _then(_value.copyWith(recording: value));
    });
  }
}

/// @nodoc

class _$PlayerEventRecordingLoadedImpl
    with DiagnosticableTreeMixin
    implements _PlayerEventRecordingLoaded {
  const _$PlayerEventRecordingLoadedImpl({required this.recording});

  @override
  final Recording recording;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.recordingLoaded(recording: $recording)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerEvent.recordingLoaded'))
      ..add(DiagnosticsProperty('recording', recording));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventRecordingLoadedImpl &&
            (identical(other.recording, recording) ||
                other.recording == recording));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recording);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEventRecordingLoadedImplCopyWith<_$PlayerEventRecordingLoadedImpl>
      get copyWith => __$$PlayerEventRecordingLoadedImplCopyWithImpl<
          _$PlayerEventRecordingLoadedImpl>(this, _$identity);
}

abstract class _PlayerEventRecordingLoaded implements PlayerEvent {
  const factory _PlayerEventRecordingLoaded(
      {required final Recording recording}) = _$PlayerEventRecordingLoadedImpl;

  Recording get recording;

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerEventRecordingLoadedImplCopyWith<_$PlayerEventRecordingLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerEventRecordingLoadingErrorImplCopyWith<$Res> {
  factory _$$PlayerEventRecordingLoadingErrorImplCopyWith(
          _$PlayerEventRecordingLoadingErrorImpl value,
          $Res Function(_$PlayerEventRecordingLoadingErrorImpl) then) =
      __$$PlayerEventRecordingLoadingErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PlayerEventRecordingLoadingErrorImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res,
        _$PlayerEventRecordingLoadingErrorImpl>
    implements _$$PlayerEventRecordingLoadingErrorImplCopyWith<$Res> {
  __$$PlayerEventRecordingLoadingErrorImplCopyWithImpl(
      _$PlayerEventRecordingLoadingErrorImpl _value,
      $Res Function(_$PlayerEventRecordingLoadingErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PlayerEventRecordingLoadingErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlayerEventRecordingLoadingErrorImpl
    with DiagnosticableTreeMixin
    implements _PlayerEventRecordingLoadingError {
  const _$PlayerEventRecordingLoadingErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.recordingLoadingError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerEvent.recordingLoadingError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventRecordingLoadingErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEventRecordingLoadingErrorImplCopyWith<
          _$PlayerEventRecordingLoadingErrorImpl>
      get copyWith => __$$PlayerEventRecordingLoadingErrorImplCopyWithImpl<
          _$PlayerEventRecordingLoadingErrorImpl>(this, _$identity);
}

abstract class _PlayerEventRecordingLoadingError implements PlayerEvent {
  const factory _PlayerEventRecordingLoadingError(
      {required final String error}) = _$PlayerEventRecordingLoadingErrorImpl;

  String get error;

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerEventRecordingLoadingErrorImplCopyWith<
          _$PlayerEventRecordingLoadingErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    implements PlayerEventPositionChanged {
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

abstract class PlayerEventPositionChanged implements PlayerEvent {
  const factory PlayerEventPositionChanged({required final Duration position}) =
      _$PlayerEventPositionChangedImpl;

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
abstract class _$$PlayerEventStartedSeekingImplCopyWith<$Res> {
  factory _$$PlayerEventStartedSeekingImplCopyWith(
          _$PlayerEventStartedSeekingImpl value,
          $Res Function(_$PlayerEventStartedSeekingImpl) then) =
      __$$PlayerEventStartedSeekingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerEventStartedSeekingImplCopyWithImpl<$Res>
    extends _$PlayerEventCopyWithImpl<$Res, _$PlayerEventStartedSeekingImpl>
    implements _$$PlayerEventStartedSeekingImplCopyWith<$Res> {
  __$$PlayerEventStartedSeekingImplCopyWithImpl(
      _$PlayerEventStartedSeekingImpl _value,
      $Res Function(_$PlayerEventStartedSeekingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayerEventStartedSeekingImpl
    with DiagnosticableTreeMixin
    implements PlayerEventStartedSeeking {
  const _$PlayerEventStartedSeekingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerEvent.startedSeeking()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PlayerEvent.startedSeeking'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEventStartedSeekingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PlayerEventStartedSeeking implements PlayerEvent {
  const factory PlayerEventStartedSeeking() = _$PlayerEventStartedSeekingImpl;
}

/// @nodoc
mixin _$PlayerState {
  int get id => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  PlayerAudioState get audioState => throw _privateConstructorUsedError;
  PlayerTextState get textState => throw _privateConstructorUsedError;

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
      {int id,
      String? error,
      PlayerAudioState audioState,
      PlayerTextState textState});

  $PlayerAudioStateCopyWith<$Res> get audioState;
  $PlayerTextStateCopyWith<$Res> get textState;
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
    Object? id = null,
    Object? error = freezed,
    Object? audioState = null,
    Object? textState = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      audioState: null == audioState
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as PlayerAudioState,
      textState: null == textState
          ? _value.textState
          : textState // ignore: cast_nullable_to_non_nullable
              as PlayerTextState,
    ) as $Val);
  }

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlayerAudioStateCopyWith<$Res> get audioState {
    return $PlayerAudioStateCopyWith<$Res>(_value.audioState, (value) {
      return _then(_value.copyWith(audioState: value) as $Val);
    });
  }

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlayerTextStateCopyWith<$Res> get textState {
    return $PlayerTextStateCopyWith<$Res>(_value.textState, (value) {
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
      {int id,
      String? error,
      PlayerAudioState audioState,
      PlayerTextState textState});

  @override
  $PlayerAudioStateCopyWith<$Res> get audioState;
  @override
  $PlayerTextStateCopyWith<$Res> get textState;
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
    Object? id = null,
    Object? error = freezed,
    Object? audioState = null,
    Object? textState = null,
  }) {
    return _then(_$PlayerStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      audioState: null == audioState
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as PlayerAudioState,
      textState: null == textState
          ? _value.textState
          : textState // ignore: cast_nullable_to_non_nullable
              as PlayerTextState,
    ));
  }
}

/// @nodoc

class _$PlayerStateImpl with DiagnosticableTreeMixin implements _PlayerState {
  const _$PlayerStateImpl(
      {required this.id,
      this.error,
      this.audioState = const PlayerAudioStateLoading(),
      this.textState = const PlayerTextStateLoading()});

  @override
  final int id;
  @override
  final String? error;
  @override
  @JsonKey()
  final PlayerAudioState audioState;
  @override
  @JsonKey()
  final PlayerTextState textState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerState(id: $id, error: $error, audioState: $audioState, textState: $textState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerState'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('audioState', audioState))
      ..add(DiagnosticsProperty('textState', textState));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.audioState, audioState) ||
                other.audioState == audioState) &&
            (identical(other.textState, textState) ||
                other.textState == textState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, error, audioState, textState);

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
      {required final int id,
      final String? error,
      final PlayerAudioState audioState,
      final PlayerTextState textState}) = _$PlayerStateImpl;

  @override
  int get id;
  @override
  String? get error;
  @override
  PlayerAudioState get audioState;
  @override
  PlayerTextState get textState;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlayerAudioState {}

/// @nodoc
abstract class $PlayerAudioStateCopyWith<$Res> {
  factory $PlayerAudioStateCopyWith(
          PlayerAudioState value, $Res Function(PlayerAudioState) then) =
      _$PlayerAudioStateCopyWithImpl<$Res, PlayerAudioState>;
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
}

/// @nodoc
abstract class _$$PlayerAudioStateDataImplCopyWith<$Res> {
  factory _$$PlayerAudioStateDataImplCopyWith(_$PlayerAudioStateDataImpl value,
          $Res Function(_$PlayerAudioStateDataImpl) then) =
      __$$PlayerAudioStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Duration position, Duration duration, bool isPlaying, bool isSeeking});
}

/// @nodoc
class __$$PlayerAudioStateDataImplCopyWithImpl<$Res>
    extends _$PlayerAudioStateCopyWithImpl<$Res, _$PlayerAudioStateDataImpl>
    implements _$$PlayerAudioStateDataImplCopyWith<$Res> {
  __$$PlayerAudioStateDataImplCopyWithImpl(_$PlayerAudioStateDataImpl _value,
      $Res Function(_$PlayerAudioStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
    Object? isPlaying = null,
    Object? isSeeking = null,
  }) {
    return _then(_$PlayerAudioStateDataImpl(
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
      isSeeking: null == isSeeking
          ? _value.isSeeking
          : isSeeking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlayerAudioStateDataImpl
    with DiagnosticableTreeMixin
    implements PlayerAudioStateData {
  const _$PlayerAudioStateDataImpl(
      {this.position = Duration.zero,
      this.duration = const Duration(seconds: 1),
      this.isPlaying = false,
      this.isSeeking = false});

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
  @JsonKey()
  final bool isSeeking;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerAudioState.data(position: $position, duration: $duration, isPlaying: $isPlaying, isSeeking: $isSeeking)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerAudioState.data'))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('isPlaying', isPlaying))
      ..add(DiagnosticsProperty('isSeeking', isSeeking));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerAudioStateDataImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.isSeeking, isSeeking) ||
                other.isSeeking == isSeeking));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, position, duration, isPlaying, isSeeking);

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerAudioStateDataImplCopyWith<_$PlayerAudioStateDataImpl>
      get copyWith =>
          __$$PlayerAudioStateDataImplCopyWithImpl<_$PlayerAudioStateDataImpl>(
              this, _$identity);
}

abstract class PlayerAudioStateData implements PlayerAudioState {
  const factory PlayerAudioStateData(
      {final Duration position,
      final Duration duration,
      final bool isPlaying,
      final bool isSeeking}) = _$PlayerAudioStateDataImpl;

  Duration get position;
  Duration get duration;
  bool get isPlaying;
  bool get isSeeking;

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerAudioStateDataImplCopyWith<_$PlayerAudioStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerAudioStateLoadingImplCopyWith<$Res> {
  factory _$$PlayerAudioStateLoadingImplCopyWith(
          _$PlayerAudioStateLoadingImpl value,
          $Res Function(_$PlayerAudioStateLoadingImpl) then) =
      __$$PlayerAudioStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerAudioStateLoadingImplCopyWithImpl<$Res>
    extends _$PlayerAudioStateCopyWithImpl<$Res, _$PlayerAudioStateLoadingImpl>
    implements _$$PlayerAudioStateLoadingImplCopyWith<$Res> {
  __$$PlayerAudioStateLoadingImplCopyWithImpl(
      _$PlayerAudioStateLoadingImpl _value,
      $Res Function(_$PlayerAudioStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayerAudioStateLoadingImpl
    with DiagnosticableTreeMixin
    implements PlayerAudioStateLoading {
  const _$PlayerAudioStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerAudioState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PlayerAudioState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerAudioStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PlayerAudioStateLoading implements PlayerAudioState {
  const factory PlayerAudioStateLoading() = _$PlayerAudioStateLoadingImpl;
}

/// @nodoc
abstract class _$$PlayerAudioStateErrorImplCopyWith<$Res> {
  factory _$$PlayerAudioStateErrorImplCopyWith(
          _$PlayerAudioStateErrorImpl value,
          $Res Function(_$PlayerAudioStateErrorImpl) then) =
      __$$PlayerAudioStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PlayerAudioStateErrorImplCopyWithImpl<$Res>
    extends _$PlayerAudioStateCopyWithImpl<$Res, _$PlayerAudioStateErrorImpl>
    implements _$$PlayerAudioStateErrorImplCopyWith<$Res> {
  __$$PlayerAudioStateErrorImplCopyWithImpl(_$PlayerAudioStateErrorImpl _value,
      $Res Function(_$PlayerAudioStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PlayerAudioStateErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlayerAudioStateErrorImpl
    with DiagnosticableTreeMixin
    implements PlayerAudioStateError {
  const _$PlayerAudioStateErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerAudioState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerAudioState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerAudioStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerAudioStateErrorImplCopyWith<_$PlayerAudioStateErrorImpl>
      get copyWith => __$$PlayerAudioStateErrorImplCopyWithImpl<
          _$PlayerAudioStateErrorImpl>(this, _$identity);
}

abstract class PlayerAudioStateError implements PlayerAudioState {
  const factory PlayerAudioStateError({required final String error}) =
      _$PlayerAudioStateErrorImpl;

  String get error;

  /// Create a copy of PlayerAudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerAudioStateErrorImplCopyWith<_$PlayerAudioStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$PlayerTextStateDataImplCopyWith<$Res> {
  factory _$$PlayerTextStateDataImplCopyWith(_$PlayerTextStateDataImpl value,
          $Res Function(_$PlayerTextStateDataImpl) then) =
      __$$PlayerTextStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int currentTextLine,
      List<TextSpan> textSpans,
      List<TextLine> textLines});
}

/// @nodoc
class __$$PlayerTextStateDataImplCopyWithImpl<$Res>
    extends _$PlayerTextStateCopyWithImpl<$Res, _$PlayerTextStateDataImpl>
    implements _$$PlayerTextStateDataImplCopyWith<$Res> {
  __$$PlayerTextStateDataImplCopyWithImpl(_$PlayerTextStateDataImpl _value,
      $Res Function(_$PlayerTextStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTextLine = null,
    Object? textSpans = null,
    Object? textLines = null,
  }) {
    return _then(_$PlayerTextStateDataImpl(
      currentTextLine: null == currentTextLine
          ? _value.currentTextLine
          : currentTextLine // ignore: cast_nullable_to_non_nullable
              as int,
      textSpans: null == textSpans
          ? _value._textSpans
          : textSpans // ignore: cast_nullable_to_non_nullable
              as List<TextSpan>,
      textLines: null == textLines
          ? _value._textLines
          : textLines // ignore: cast_nullable_to_non_nullable
              as List<TextLine>,
    ));
  }
}

/// @nodoc

class _$PlayerTextStateDataImpl
    with DiagnosticableTreeMixin
    implements PlayerTextStateData {
  const _$PlayerTextStateDataImpl(
      {this.currentTextLine = 0,
      final List<TextSpan> textSpans = const <TextSpan>[],
      final List<TextLine> textLines = const <TextLine>[]})
      : _textSpans = textSpans,
        _textLines = textLines;

  @override
  @JsonKey()
  final int currentTextLine;
  final List<TextSpan> _textSpans;
  @override
  @JsonKey()
  List<TextSpan> get textSpans {
    if (_textSpans is EqualUnmodifiableListView) return _textSpans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textSpans);
  }

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
    return 'PlayerTextState.data(currentTextLine: $currentTextLine, textSpans: $textSpans, textLines: $textLines)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerTextState.data'))
      ..add(DiagnosticsProperty('currentTextLine', currentTextLine))
      ..add(DiagnosticsProperty('textSpans', textSpans))
      ..add(DiagnosticsProperty('textLines', textLines));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerTextStateDataImpl &&
            (identical(other.currentTextLine, currentTextLine) ||
                other.currentTextLine == currentTextLine) &&
            const DeepCollectionEquality()
                .equals(other._textSpans, _textSpans) &&
            const DeepCollectionEquality()
                .equals(other._textLines, _textLines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTextLine,
      const DeepCollectionEquality().hash(_textSpans),
      const DeepCollectionEquality().hash(_textLines));

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerTextStateDataImplCopyWith<_$PlayerTextStateDataImpl> get copyWith =>
      __$$PlayerTextStateDataImplCopyWithImpl<_$PlayerTextStateDataImpl>(
          this, _$identity);
}

abstract class PlayerTextStateData implements PlayerTextState {
  const factory PlayerTextStateData(
      {final int currentTextLine,
      final List<TextSpan> textSpans,
      final List<TextLine> textLines}) = _$PlayerTextStateDataImpl;

  int get currentTextLine;
  List<TextSpan> get textSpans;
  List<TextLine> get textLines;

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerTextStateDataImplCopyWith<_$PlayerTextStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerTextStateLoadingImplCopyWith<$Res> {
  factory _$$PlayerTextStateLoadingImplCopyWith(
          _$PlayerTextStateLoadingImpl value,
          $Res Function(_$PlayerTextStateLoadingImpl) then) =
      __$$PlayerTextStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerTextStateLoadingImplCopyWithImpl<$Res>
    extends _$PlayerTextStateCopyWithImpl<$Res, _$PlayerTextStateLoadingImpl>
    implements _$$PlayerTextStateLoadingImplCopyWith<$Res> {
  __$$PlayerTextStateLoadingImplCopyWithImpl(
      _$PlayerTextStateLoadingImpl _value,
      $Res Function(_$PlayerTextStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayerTextStateLoadingImpl
    with DiagnosticableTreeMixin
    implements PlayerTextStateLoading {
  const _$PlayerTextStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerTextState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PlayerTextState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerTextStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PlayerTextStateLoading implements PlayerTextState {
  const factory PlayerTextStateLoading() = _$PlayerTextStateLoadingImpl;
}

/// @nodoc
abstract class _$$PlayerTextStateProcessingImplCopyWith<$Res> {
  factory _$$PlayerTextStateProcessingImplCopyWith(
          _$PlayerTextStateProcessingImpl value,
          $Res Function(_$PlayerTextStateProcessingImpl) then) =
      __$$PlayerTextStateProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerTextStateProcessingImplCopyWithImpl<$Res>
    extends _$PlayerTextStateCopyWithImpl<$Res, _$PlayerTextStateProcessingImpl>
    implements _$$PlayerTextStateProcessingImplCopyWith<$Res> {
  __$$PlayerTextStateProcessingImplCopyWithImpl(
      _$PlayerTextStateProcessingImpl _value,
      $Res Function(_$PlayerTextStateProcessingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayerTextStateProcessingImpl
    with DiagnosticableTreeMixin
    implements PlayerTextStateProcessing {
  const _$PlayerTextStateProcessingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerTextState.processing()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PlayerTextState.processing'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerTextStateProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PlayerTextStateProcessing implements PlayerTextState {
  const factory PlayerTextStateProcessing() = _$PlayerTextStateProcessingImpl;
}

/// @nodoc
abstract class _$$PlayerTextStateErrorImplCopyWith<$Res> {
  factory _$$PlayerTextStateErrorImplCopyWith(_$PlayerTextStateErrorImpl value,
          $Res Function(_$PlayerTextStateErrorImpl) then) =
      __$$PlayerTextStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PlayerTextStateErrorImplCopyWithImpl<$Res>
    extends _$PlayerTextStateCopyWithImpl<$Res, _$PlayerTextStateErrorImpl>
    implements _$$PlayerTextStateErrorImplCopyWith<$Res> {
  __$$PlayerTextStateErrorImplCopyWithImpl(_$PlayerTextStateErrorImpl _value,
      $Res Function(_$PlayerTextStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PlayerTextStateErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlayerTextStateErrorImpl
    with DiagnosticableTreeMixin
    implements PlayerTextStateError {
  const _$PlayerTextStateErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerTextState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerTextState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerTextStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerTextStateErrorImplCopyWith<_$PlayerTextStateErrorImpl>
      get copyWith =>
          __$$PlayerTextStateErrorImplCopyWithImpl<_$PlayerTextStateErrorImpl>(
              this, _$identity);
}

abstract class PlayerTextStateError implements PlayerTextState {
  const factory PlayerTextStateError({required final String error}) =
      _$PlayerTextStateErrorImpl;

  String get error;

  /// Create a copy of PlayerTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerTextStateErrorImplCopyWith<_$PlayerTextStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

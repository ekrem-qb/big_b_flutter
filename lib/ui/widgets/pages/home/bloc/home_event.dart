part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeTabChanged extends HomeEvent {
  const HomeTabChanged(this.index);

  final int index;

  @override
  List<Object> get props => [
        index,
      ];
}

final class _HomeSignedOut extends HomeEvent {
  const _HomeSignedOut();
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'home_bloc.freezed.dart';
part 'home_bloc.g.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((final event, final emit) {
      return switch (event) {
        HomeTabChanged() => emit(state.copyWith(selectedTabIndex: event.index)),
      };
    });
  }

  @override
  HomeState? fromJson(final Map<String, dynamic> json) {
    try {
      return HomeState.fromJson(json);
    } on Exception {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(final HomeState state) {
    try {
      return state.toJson();
    } on Exception {
      return null;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(final Bloc<Object?, Object?> bloc, final Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('onEvent: ${bloc.runtimeType} $event');
    }
  }

  @override
  void onError(
    final BlocBase<Object?> bloc,
    final Object error,
    final StackTrace stackTrace,
  ) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      print('onError: ${bloc.runtimeType} $error $stackTrace');
    }
  }

  @override
  void onTransition(
    final Bloc<Object?, Object?> bloc,
    final Transition<Object?, Object?> transition,
  ) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('onTransition: ${bloc.runtimeType} $transition');
    }
  }

  @override
  void onChange(final BlocBase<Object?> bloc, final Change<Object?> change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('onChange: ${bloc.runtimeType} $change');
    }
  }
}

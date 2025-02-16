import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(final Bloc<dynamic, dynamic> bloc, final Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('onEvent: ${bloc.runtimeType} $event');
    }
  }

  @override
  void onError(
    final BlocBase<dynamic> bloc,
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
    final Bloc<dynamic, dynamic> bloc,
    final Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('onTransition: ${bloc.runtimeType} $transition');
    }
  }

  @override
  void onChange(final BlocBase<dynamic> bloc, final Change<dynamic> change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('onChange: ${bloc.runtimeType} $change');
    }
  }
}

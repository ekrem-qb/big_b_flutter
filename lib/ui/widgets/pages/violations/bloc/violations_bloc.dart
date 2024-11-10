// import 'package:bloc/bloc.dart';

// import '../../../../../api/entity/violation/violation.dart';
// import '../../../../entity/status.dart';
// import '../../../lister/bloc/lister_bloc.dart';

// class ViolationsBloc extends ListerBloc<Violation> {
//   @override
//   String get tableName => Violation.tableName;

//   @override
//   String get fieldNames => Violation.fieldNames;

//   @override
//   String get orderBy => $NormalViolationImplJsonKeys.id;

//   @override
//   bool get ascending => false;

//   @override
//   String get idFieldKey => $NormalViolationImplJsonKeys.id;

//   @override
//   List<Violation>? Function(List<Map<String, dynamic>> data) get converter => Violation.converter;

//   @override
//   Violation Function(Map<String, dynamic> json) get fromJson => Violation.fromJson;

//   @override
//   bool Function(Violation a, Violation b) get isAfter => (final a, final b) => a.id > b.id;

//   @override
//   Future<void> onDataUpdated(final Emitter<StatusOf<ListerState>> emit, final ListerEventDataUpdated event) async {
//     add(const ListerEventLoadRequested());
//   }
// }

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/violation/violation.dart';
import '../../../../entity/status.dart';

part 'violations_bloc.freezed.dart';
part 'violations_event.dart';
part 'violations_state.dart';

class ViolationsBloc extends Bloc<ViolationsEvent, ViolationsState> {
  ViolationsBloc({
    required final int id,
    final List<Violation>? violations,
  }) : super(
          ViolationsState(
            id: id,
            violations: violations == null ? const StatusOfLoading() : StatusOfData(violations),
          ),
        ) {
    on<ViolationsEvent>(
      (final event, final emit) async {
        return switch (event) {
          ViolationsEventLoadRequested() => _onViolationsLoadRequested(event, emit),
        };
      },
      transformer: concurrent(),
    );

    if (state.violations is StatusOfLoading) {
      add(const ViolationsEventLoadRequested());
    }
  }

  Future<void> _onViolationsLoadRequested(final ViolationsEventLoadRequested event, final Emitter<ViolationsState> emit) async {
    try {
      emit(state.copyWith(violations: const StatusOfLoading()));

      final violations = await db.from(Violation.tableName).select(Violation.fieldNames).eq('record', state.id).withConverter(Violation.converter) ?? List.empty();

      emit(
        state.copyWith(
          violations: StatusOfData(
            violations,
          ),
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(violations: StatusOfError(e.toString())));
    }
  }
}

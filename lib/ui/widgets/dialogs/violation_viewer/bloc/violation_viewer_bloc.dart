import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/violation/violation.dart';
import '../../../../entity/status.dart';

part 'violation_viewer_bloc.freezed.dart';
part 'violation_viewer_event.dart';
part 'violation_viewer_state.dart';

class ViolationViewerBloc extends Bloc<ViolationViewerEvent, ViolationViewerState> {
  ViolationViewerBloc(final int id, final Violation? originalViolation)
      : super(
          ViolationViewerState(
            id: id,
            violation: originalViolation != null ? StatusOfData(originalViolation) : const StatusOfLoading(),
          ),
        ) {
    on<ViolationViewerEvent>((final event, final emit) {
      return switch (event) {
        ViolationViewerEventLoadRequested() => _onLoadRequested(event, emit),
      };
    });

    if (state.violation is StatusOfLoading) {
      add(const ViolationViewerEventLoadRequested());
    }
  }

  Future<void> _onLoadRequested(final ViolationViewerEvent event, final Emitter<ViolationViewerState> emit) async {
    try {
      if (state.violation is StatusOfError) {
        emit(state.copyWith(violation: const StatusOfLoading()));
      }

      final violation = await db.from(Violation.tableName).select(Violation.fieldNames).eq($NormalViolationImplJsonKeys.id, state.id).maybeSingle().withConverter(Violation.maybeFromJson);

      if (violation == null) {
        emit(state.copyWith(violation: const StatusOfError('Görev bulunamadı')));
        return;
      }

      emit(state.copyWith(violation: StatusOfData(violation)));
    } on Exception catch (e) {
      emit(state.copyWith(violation: StatusOfError(e.toString())));
    }
  }
}

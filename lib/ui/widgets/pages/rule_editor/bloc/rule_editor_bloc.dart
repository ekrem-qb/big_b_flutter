import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/rule/rule.dart';
import '../../../../entity/status.dart';

part 'rule_editor_bloc.freezed.dart';
part 'rule_editor_event.dart';
part 'rule_editor_state.dart';

class RuleEditorBloc extends Bloc<RuleEditorEvent, RuleEditorState> {
  RuleEditorBloc({final int? id, final Rule? originalRule})
      : super(
          id == null
              ? const RuleEditorStateCreate()
              : originalRule == null
                  ? RuleEditorStateLoading(id: id)
                  : RuleEditorStateEdit(
                      id: id,
                      description: originalRule.description,
                      details: originalRule.details,
                      color: originalRule.color,
                    ),
        ) {
    on<RuleEditorEvent>((final event, final emit) {
      return switch (event) {
        RuleEditorEventLoadRequested() => _onLoadRequested(event, emit),
        RuleEditorEventDescriptionChanged() => _onDescriptionChanged(event, emit),
        RuleEditorEventDetailsChanged() => _onDetailsChanged(event, emit),
        RuleEditorEventColorChanged() => _onColorChanged(event, emit),
        RuleEditorEventSaveRequested() => _onSaveRequested(event, emit),
        RuleEditorEventDeleteDialogOpened() => _onDeleteDialogOpened(event, emit),
        RuleEditorEventDeleteDialogClosed() => _onDeleteDialogClosed(event, emit),
      };
    });
    if (state is RuleEditorStateLoading) {
      add(const RuleEditorEventLoadRequested());
    }
  }

  Future<void> _onLoadRequested(final RuleEditorEvent event, final Emitter<RuleEditorState> emit) async {
    if (state
        case RuleEditorStateError(
          :final id,
        )) {
      emit(RuleEditorStateLoading(id: id));
    }

    final currentState = state;

    if (currentState is! RuleEditorStateLoading) return;

    try {
      final rule = await db.from(Rule.tableName).select(Rule.fieldNames).eq($RuleImplJsonKeys.id, currentState.id).single().withConverter(Rule.fromJson);
      emit(
        RuleEditorStateEdit(
          id: currentState.id,
          description: rule.description,
          details: rule.details,
          color: rule.color,
        ),
      );
    } on Exception catch (e) {
      emit(
        RuleEditorStateError(
          id: currentState.id,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onDescriptionChanged(final RuleEditorEventDescriptionChanged event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    switch (currentState) {
      case RuleEditorStateEdit():
        emit(
          currentState.copyWith(
            description: event.value,
            descriptionError: null,
          ),
        );
      case RuleEditorStateCreate():
        emit(
          currentState.copyWith(
            description: event.value,
            descriptionError: null,
          ),
        );
      default:
        return;
    }
  }

  Future<void> _onDetailsChanged(final RuleEditorEventDetailsChanged event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    if (currentState is! RuleEditorStateCreate) return;

    emit(
      currentState.copyWith(
        details: event.value,
      ),
    );
  }

  Future<void> _onColorChanged(final RuleEditorEventColorChanged event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    switch (currentState) {
      case RuleEditorStateCreate():
        emit(
          currentState.copyWith(
            color: event.value,
          ),
        );
      case RuleEditorStateEdit():
        emit(
          currentState.copyWith(
            color: event.value,
          ),
        );
      default:
    }
  }

  Future<void> _onSaveRequested(final RuleEditorEventSaveRequested event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    switch (currentState) {
      case RuleEditorStateCreate():
        emit(
          currentState.copyWith(
            description: currentState.description.trim(),
          ),
        );

        if (currentState.description.isEmpty) {
          emit(
            currentState.copyWith(
              descriptionError: 'Açıklama giriniz',
            ),
          );
          return;
        }

        emit(
          currentState.copyWith(
            details: currentState.details.trim(),
          ),
        );

        emit(
          currentState.copyWith(
            uploadState: const StatusInProgress(),
          ),
        );

        if (await _upload(emit: emit)) {
          emit(
            currentState.copyWith(
              uploadState: const StatusCompleted(),
            ),
          );
        } else {
          emit(
            currentState.copyWith(
              uploadState: const StatusInitial(),
            ),
          );
        }
      case RuleEditorStateEdit():
        emit(
          currentState.copyWith(
            description: currentState.description.trim(),
          ),
        );

        if (currentState.description.isEmpty) {
          emit(
            currentState.copyWith(
              descriptionError: 'Açıklama giriniz',
            ),
          );
        }

        emit(
          currentState.copyWith(
            uploadState: const StatusInProgress(),
          ),
        );

        if (await _upload(emit: emit)) {
          emit(
            currentState.copyWith(
              uploadState: const StatusCompleted(),
            ),
          );
          return;
        } else {
          emit(
            currentState.copyWith(
              uploadState: const StatusInitial(),
            ),
          );
        }
      default:
    }
  }

  Future<bool> _upload({required final Emitter<RuleEditorState> emit}) async {
    final currentState = state;
    try {
      switch (currentState) {
        case RuleEditorStateCreate(
                :final description,
                :final details,
                :final color,
              ) ||
              RuleEditorStateEdit(
                :final description,
                :final details,
                :final color,
              ):
          final rule = Rule(
            id: -1,
            description: description,
            details: details,
            color: color,
          );

          switch (currentState) {
            case RuleEditorStateCreate():
              await db.from(Rule.tableName).insert(rule.toJson());
            case RuleEditorStateEdit(
                :final id,
              ):
              await db.from(Rule.tableName).update(rule.toJson()).eq($RuleImplJsonKeys.id, id);
            default:
          }

          return true;
        default:
          return false;
      }
    } on Exception catch (e) {
      switch (currentState) {
        case RuleEditorStateCreate():
          emit(currentState.copyWith(uploadState: StatusError(e.toString())));
        case RuleEditorStateEdit():
          emit(currentState.copyWith(uploadState: StatusError(e.toString())));
        default:
      }
      return false;
    }
  }

  Future<void> _onDeleteDialogOpened(final RuleEditorEventDeleteDialogOpened event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    if (currentState is! RuleEditorStateEdit) return;

    emit(
      currentState.copyWith(
        deleteState: const StatusInProgress(),
      ),
    );
  }

  Future<void> _onDeleteDialogClosed(final RuleEditorEventDeleteDialogClosed event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    if (currentState is! RuleEditorStateEdit) return;

    if (event.isDeleted) {
      try {
        await db.from(Rule.tableName).delete().eq($RuleImplJsonKeys.id, currentState.id);

        emit(
          currentState.copyWith(
            deleteState: const StatusCompleted(),
          ),
        );
        return;
      } on Exception catch (e) {
        emit(
          currentState.copyWith(
            deleteState: StatusError(e.toString()),
          ),
        );
        return;
      }
    }

    emit(
      currentState.copyWith(
        deleteState: const Status.initial(),
      ),
    );
  }
}

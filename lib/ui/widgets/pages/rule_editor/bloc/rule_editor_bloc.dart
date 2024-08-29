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
              : RuleEditorStateEdit(
                  id: id,
                  editState: originalRule == null
                      ? const StatusOfLoading()
                      : StatusOfData(
                          RuleEditorStateEditState(
                            description: originalRule.description,
                            details: originalRule.details,
                            color: originalRule.color,
                          ),
                        ),
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
    if (state
        case RuleEditorStateEdit(
          editState: StatusOfLoading(),
        )) {
      add(const RuleEditorEventLoadRequested());
    }
  }

  Future<void> _onLoadRequested(final RuleEditorEvent event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    if (currentState
        case RuleEditorStateEdit(
          :final id,
          :final editState,
        )) {
      if (editState case StatusOfError()) {
        emit(
          currentState.copyWith(
            editState: const StatusOfLoading(),
          ),
        );
      }

      try {
        final rule = await db.from(Rule.tableName).select(Rule.fieldNames).eq($RuleImplJsonKeys.id, id).single().withConverter(Rule.fromJson);
        emit(
          currentState.copyWith(
            editState: StatusOfData(
              RuleEditorStateEditState(
                description: rule.description,
                details: rule.details,
                color: rule.color,
              ),
            ),
          ),
        );
      } on Exception catch (e) {
        emit(
          currentState.copyWith(
            editState: StatusOfError(e.toString()),
          ),
        );
      }
    }
  }

  Future<void> _onDescriptionChanged(final RuleEditorEventDescriptionChanged event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    switch (currentState) {
      case RuleEditorStateEdit(
          editState: StatusOfData(
            :final data,
          ),
        ):
        emit(
          currentState.copyWith(
            editState: StatusOfData(
              data.copyWith(
                description: event.value,
                descriptionError: null,
              ),
            ),
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
    }
  }

  Future<void> _onDetailsChanged(final RuleEditorEventDetailsChanged event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    switch (currentState) {
      case RuleEditorStateEdit(
          editState: StatusOfData(
            :final data,
          ),
        ):
        emit(
          currentState.copyWith(
            editState: StatusOfData(
              data.copyWith(
                details: event.value,
              ),
            ),
          ),
        );
      case RuleEditorStateCreate():
        emit(
          currentState.copyWith(
            details: event.value,
          ),
        );
      default:
    }
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
      case RuleEditorStateEdit(
          editState: StatusOfData(
            :final data,
          ),
        ):
        emit(
          currentState.copyWith(
            editState: StatusOfData(
              data.copyWith(
                color: event.value,
              ),
            ),
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
      case RuleEditorStateEdit(
          editState: StatusOfData(
            :final data,
          ),
        ):
        emit(
          currentState.copyWith(
            editState: StatusOfData(
              data.copyWith(
                description: data.description.trim(),
              ),
            ),
          ),
        );

        if (data.description.isEmpty) {
          emit(
            currentState.copyWith(
              editState: StatusOfData(
                data.copyWith(
                  descriptionError: 'Açıklama giriniz',
                ),
              ),
            ),
          );
        }

        emit(
          currentState.copyWith(
            editState: StatusOfData(
              data.copyWith(
                uploadState: const StatusInProgress(),
              ),
            ),
          ),
        );

        if (await _upload(emit: emit)) {
          emit(
            currentState.copyWith(
              editState: StatusOfData(
                data.copyWith(
                  uploadState: const StatusCompleted(),
                ),
              ),
            ),
          );
          return;
        } else {
          emit(
            currentState.copyWith(
              editState: StatusOfData(
                data.copyWith(
                  uploadState: const StatusInitial(),
                ),
              ),
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
                editState: StatusOfData(
                  data: RuleEditorStateEditState(
                    :final description,
                    :final details,
                    :final color,
                  )
                ),
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
        case RuleEditorStateEdit(
            editState: StatusOfData(
              :final data,
            )
          ):
          emit(currentState.copyWith(editState: StatusOfData(data.copyWith(uploadState: StatusError(e.toString())))));
        default:
      }
      return false;
    }
  }

  Future<void> _onDeleteDialogOpened(final RuleEditorEventDeleteDialogOpened event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    if (currentState
        case RuleEditorStateEdit(
          editState: StatusOfData(
            :final data,
          ),
        )) {
      emit(
        currentState.copyWith(
          editState: StatusOfData(
            data.copyWith(
              deleteState: const StatusInProgress(),
            ),
          ),
        ),
      );
    }
  }

  Future<void> _onDeleteDialogClosed(final RuleEditorEventDeleteDialogClosed event, final Emitter<RuleEditorState> emit) async {
    final currentState = state;

    if (currentState
        case RuleEditorStateEdit(
          editState: StatusOfData(
            :final data,
          ),
        )) {
      if (event.isDeleted) {
        try {
          await db.from(Rule.tableName).delete().eq($RuleImplJsonKeys.id, currentState.id);

          emit(
            currentState.copyWith(
              editState: StatusOfData(
                data.copyWith(
                  deleteState: const StatusCompleted(),
                ),
              ),
            ),
          );
          return;
        } on Exception catch (e) {
          emit(
            currentState.copyWith(
              editState: StatusOfData(
                data.copyWith(
                  deleteState: StatusError(e.toString()),
                ),
              ),
            ),
          );
          return;
        }
      }

      emit(
        currentState.copyWith(
          editState: StatusOfData(
            data.copyWith(
              deleteState: const Status.initial(),
            ),
          ),
        ),
      );
    }
  }
}

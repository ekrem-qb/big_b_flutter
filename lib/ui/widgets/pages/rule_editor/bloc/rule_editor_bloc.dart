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
              editState:
                  originalRule == null
                      ? const StatusOfLoading()
                      : StatusOfData(
                        RuleEditorStateEditState(rule: originalRule),
                      ),
            ),
      ) {
    on<RuleEditorEvent>((final event, final emit) {
      return switch (event) {
        RuleEditorEventLoadRequested() => _onLoadRequested(event, emit),
        RuleEditorEventTypeChanged() => _onTypeChanged(event, emit),
        RuleEditorEventWordsAdded() => _onWordsAdded(event, emit),
        RuleEditorEventWordRemoved() => _onWordRemoved(event, emit),
        RuleEditorEventDescriptionChanged() => _onDescriptionChanged(
          event,
          emit,
        ),
        RuleEditorEventDetailsChanged() => _onDetailsChanged(event, emit),
        RuleEditorEventColorChanged() => _onColorChanged(event, emit),
        RuleEditorEventSaveRequested() => _onSaveRequested(event, emit),
        RuleEditorEventDeleteRequested() => _onDeleteRequested(event, emit),
      };
    });
    if (state case RuleEditorStateEdit(editState: StatusOfLoading())) {
      add(const RuleEditorEventLoadRequested());
    }
  }

  Future<void> _onLoadRequested(
    final RuleEditorEvent event,
    final Emitter<RuleEditorState> emit,
  ) async {
    if (state case RuleEditorStateEdit(
      :final id,
      :final editState,
      :final copyWith,
    )) {
      if (editState case StatusOfError()) {
        emit(copyWith(editState: const StatusOfLoading()));
      }

      try {
        final rule = await db
            .from(Rule.tableName)
            .select(Rule.fieldNames)
            .eq($CustomRuleImplJsonKeys.id, id)
            .single()
            .withConverter(Rule.fromJson);
        emit(
          copyWith(
            editState: StatusOfData(RuleEditorStateEditState(rule: rule)),
          ),
        );
      } catch (e) {
        emit(copyWith(editState: StatusOfError(e.toString())));
      }
    }
  }

  Future<void> _onTypeChanged(
    final RuleEditorEventTypeChanged event,
    final Emitter<RuleEditorState> emit,
  ) async {
    switch (state) {
      case RuleEditorStateCreate(:final rule, :final copyWith):
        if (rule.runtimeType == event.value.runtimeType) return;

        emit(
          copyWith(
            rule: switch (event.value) {
              WordsRule() => WordsRule(
                id: rule.id,
                words: {},
                color: rule.color,
              ),
              NameRule() => NameRule(id: rule.id, color: rule.color),
              CustomRule() => CustomRule(
                id: rule.id,
                description: '',
                details: '',
                color: rule.color,
              ),
            },
          ),
        );
      case RuleEditorStateEdit(
        editState: StatusOfData(:final data),
        :final copyWith,
      ):
        if (data.rule.runtimeType == event.value.runtimeType) return;

        emit(
          copyWith(
            editState: StatusOfData(
              data.copyWith(
                rule: switch (event.value) {
                  WordsRule() => WordsRule(
                    id: data.rule.id,
                    words: {},
                    color: data.rule.color,
                  ),
                  NameRule() => NameRule(
                    id: data.rule.id,
                    color: data.rule.color,
                  ),
                  CustomRule() => CustomRule(
                    id: data.rule.id,
                    description: '',
                    details: '',
                    color: data.rule.color,
                  ),
                },
              ),
            ),
          ),
        );
      default:
    }
  }

  Future<void> _onWordsAdded(
    final RuleEditorEventWordsAdded event,
    final Emitter<RuleEditorState> emit,
  ) async {
    switch (state) {
      case RuleEditorStateCreate(:final rule, :final copyWith):
        switch (rule) {
          case WordsRule(:final words):
            emit(
              copyWith(rule: rule.copyWith(words: {...words, ...event.value})),
            );
          default:
        }
      case RuleEditorStateEdit(
        editState: StatusOfData(:final data),
        :final copyWith,
      ):
        final rule = data.rule;
        switch (rule) {
          case WordsRule(:final words):
            emit(
              copyWith(
                editState: StatusOfData(
                  data.copyWith(
                    rule: rule.copyWith(words: {...words, ...event.value}),
                  ),
                ),
              ),
            );
          default:
        }
      default:
    }
  }

  Future<void> _onWordRemoved(
    final RuleEditorEventWordRemoved event,
    final Emitter<RuleEditorState> emit,
  ) async {
    switch (state) {
      case RuleEditorStateCreate(:final rule, :final copyWith):
        switch (rule) {
          case WordsRule(:final words):
            emit(
              copyWith(
                rule: rule.copyWith(words: {...words}..remove(event.value)),
              ),
            );
          default:
        }
      case RuleEditorStateEdit(
        editState: StatusOfData(:final data),
        :final copyWith,
      ):
        final rule = data.rule;
        switch (rule) {
          case WordsRule(:final words):
            emit(
              copyWith(
                editState: StatusOfData(
                  data.copyWith(
                    rule: rule.copyWith(words: {...words}..remove(event.value)),
                  ),
                ),
              ),
            );
          default:
        }
      default:
    }
  }

  Future<void> _onDescriptionChanged(
    final RuleEditorEventDescriptionChanged event,
    final Emitter<RuleEditorState> emit,
  ) async {
    switch (state) {
      case RuleEditorStateEdit(
        editState: StatusOfData(
          data: RuleEditorStateEditState(
            rule: final CustomRule rule,
            copyWith: final dataCopyWith,
          ),
        ),
        :final copyWith,
      ):
        emit(
          copyWith(
            editState: StatusOfData(
              dataCopyWith(
                rule: rule.copyWith(description: event.value.trim()),
                descriptionError: null,
              ),
            ),
          ),
        );
      case RuleEditorStateCreate(rule: final CustomRule rule, :final copyWith):
        emit(
          copyWith(
            rule: rule.copyWith(description: event.value.trim()),
            descriptionError: null,
          ),
        );
      default:
    }
  }

  Future<void> _onDetailsChanged(
    final RuleEditorEventDetailsChanged event,
    final Emitter<RuleEditorState> emit,
  ) async {
    switch (state) {
      case RuleEditorStateEdit(
        editState: StatusOfData(
          data: RuleEditorStateEditState(
            rule: final CustomRule rule,
            copyWith: final dataCopyWith,
          ),
        ),
        :final copyWith,
      ):
        emit(
          copyWith(
            editState: StatusOfData(
              dataCopyWith(rule: rule.copyWith(details: event.value.trim())),
            ),
          ),
        );

      case RuleEditorStateCreate(rule: final CustomRule rule, :final copyWith):
        emit(copyWith(rule: rule.copyWith(details: event.value.trim())));
      default:
    }
  }

  Future<void> _onColorChanged(
    final RuleEditorEventColorChanged event,
    final Emitter<RuleEditorState> emit,
  ) async {
    switch (state) {
      case RuleEditorStateCreate(:final rule, :final copyWith):
        emit(copyWith(rule: rule.copyWith(color: event.value)));
      case RuleEditorStateEdit(
        editState: StatusOfData(:final data),
        :final copyWith,
      ):
        emit(
          copyWith(
            editState: StatusOfData(
              data.copyWith(rule: data.rule.copyWith(color: event.value)),
            ),
          ),
        );
      default:
    }
  }

  Future<void> _onSaveRequested(
    final RuleEditorEventSaveRequested event,
    final Emitter<RuleEditorState> emit,
  ) async {
    switch (state) {
      case RuleEditorStateCreate(:final rule, :final copyWith):
        if (switch (rule) {
          CustomRule(:final description) => description.isEmpty,
          _ => false,
        }) {
          emit(copyWith(descriptionError: 'Açıklama giriniz'));
          return;
        }

        emit(copyWith(uploadState: const OperationStatusInProgress()));

        if (await _upload(emit: emit)) {
          emit(copyWith(uploadState: const OperationStatusCompleted()));
        } else {
          emit(copyWith(uploadState: const OperationStatusInitial()));
        }
      case RuleEditorStateEdit(
        editState: StatusOfData(:final data),
        :final copyWith,
      ):
        if (switch (data.rule) {
          CustomRule(:final description) => description.isEmpty,
          _ => false,
        }) {
          emit(
            copyWith(
              editState: StatusOfData(
                data.copyWith(descriptionError: 'Açıklama giriniz'),
              ),
            ),
          );
          return;
        }

        emit(
          copyWith(
            editState: StatusOfData(
              data.copyWith(uploadState: const OperationStatusInProgress()),
            ),
          ),
        );

        if (await _upload(emit: emit)) {
          emit(
            copyWith(
              editState: StatusOfData(
                data.copyWith(uploadState: const OperationStatusCompleted()),
              ),
            ),
          );
          return;
        } else {
          emit(
            copyWith(
              editState: StatusOfData(
                data.copyWith(uploadState: const OperationStatusInitial()),
              ),
            ),
          );
        }
      default:
    }
  }

  Future<bool> _upload({required final Emitter<RuleEditorState> emit}) async {
    try {
      switch (state) {
        case RuleEditorStateCreate(:final rule) ||
            RuleEditorStateEdit(
              editState: StatusOfData(
                data: RuleEditorStateEditState(:final rule),
              ),
            ):
          switch (state) {
            case RuleEditorStateCreate():
              await db.from(Rule.tableName).insert(rule.toJson());
            case RuleEditorStateEdit(:final id):
              await db
                  .from(Rule.tableName)
                  .update(rule.toJson())
                  .eq($CustomRuleImplJsonKeys.id, id);
          }

          return true;
        default:
          return false;
      }
    } catch (e) {
      switch (state) {
        case RuleEditorStateCreate(:final copyWith):
          emit(copyWith(uploadState: OperationStatusError(e.toString())));
        case RuleEditorStateEdit(
          editState: StatusOfData(:final data),
          :final copyWith,
        ):
          emit(
            copyWith(
              editState: StatusOfData(
                data.copyWith(uploadState: OperationStatusError(e.toString())),
              ),
            ),
          );
        default:
      }
      return false;
    }
  }

  Future<void> _onDeleteRequested(
    final RuleEditorEventDeleteRequested event,
    final Emitter<RuleEditorState> emit,
  ) async {
    if (state case RuleEditorStateEdit(
      :final id,
      editState: StatusOfData(:final data),
      :final copyWith,
    )) {
      emit(
        copyWith(
          editState: StatusOfData(
            data.copyWith(deleteState: const OperationStatusInProgress()),
          ),
        ),
      );

      try {
        await db
            .from(Rule.tableName)
            .delete()
            .eq($CustomRuleImplJsonKeys.id, id);

        emit(
          copyWith(
            editState: StatusOfData(
              data.copyWith(deleteState: const OperationStatusCompleted()),
            ),
          ),
        );
      } catch (e) {
        emit(
          copyWith(
            editState: StatusOfData(
              data.copyWith(deleteState: OperationStatusError(e.toString())),
            ),
          ),
        );
      }
    }
  }
}

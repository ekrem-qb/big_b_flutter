import 'package:auto_route/auto_route.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/entity/rule/rule.dart';
import '../../../entity/status.dart';
import '../../../theme.dart';
import '../../dialogs/delete_dialog.dart';
import '../../error_panel.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../extensions/snackbar.dart';
import '../../save_button.dart';
import 'bloc/rule_editor_bloc.dart';

@RoutePage()
class NewRuleEditorPage extends StatelessWidget {
  const NewRuleEditorPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => RuleEditorBloc(),
      child: const RuleEditorView(isNew: true),
    );
  }
}

@RoutePage()
class RuleEditorPage extends StatelessWidget {
  const RuleEditorPage({@pathParam required this.id, this.rule, super.key});

  final int id;
  final Rule? rule;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => RuleEditorBloc(id: id, originalRule: rule),
      child: const RuleEditorView(isNew: false),
    );
  }
}

class RuleEditorView extends StatelessWidget {
  const RuleEditorView({
    required this.isNew,
    super.key,
  });

  final bool isNew;

  @override
  Widget build(final BuildContext context) {
    late final RuleEditorBloc bloc;
    var isInitialized = false;
    context.select((final RuleEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        RuleEditorStateEdit(
          :final editState,
        ) =>
          editState.runtimeType,
        RuleEditorStateCreate() => null,
      };
    });

    return MouseNavigator(
      child: BlocListener<RuleEditorBloc, RuleEditorState>(
        listener: (final context, final state) async {
          switch (state) {
            case RuleEditorStateCreate(
                    :final uploadState,
                  ) ||
                  RuleEditorStateEdit(
                    editState: StatusOfData(
                      data: RuleEditorStateEditState(
                        :final uploadState,
                      )
                    )
                  ):
              switch (uploadState) {
                case OperationStatusCompleted():
                  Navigator.pop(context);
                case OperationStatusError(
                    :final error
                  ):
                  showSnackbar(text: error, context: context);
                default:
              }
              switch (state) {
                case RuleEditorStateEdit(
                    editState: StatusOfData(
                      data: RuleEditorStateEditState(
                        :final deleteState,
                      )
                    )
                  ):
                  switch (deleteState) {
                    case OperationStatusInProgress():
                      final isDeleted = await showDeleteDialog(itemName: 'kuralı', context: context);
                      bloc.add(RuleEditorEventDeleteDialogClosed(isDeleted: isDeleted));
                    case OperationStatusCompleted():
                      Navigator.pop(context);
                    case OperationStatusError(
                        :final error
                      ):
                      showSnackbar(text: error, context: context);
                    default:
                  }
                default:
              }
            default:
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: isNew ? const Text('Yeni kural') : null,
            actions: [
              if (!isNew) const _DeleteButton(),
            ],
          ),
          body: switch (bloc.state) {
            RuleEditorStateEdit(
              :final editState,
            ) =>
              switch (editState) {
                StatusOfLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                StatusOfError(
                  :final error
                ) =>
                  ErrorPanel(
                    error: error,
                    onRefresh: () => bloc.add(const RuleEditorEventLoadRequested()),
                  ),
                _ => _Body(isNew: isNew),
              },
            _ => _Body(isNew: isNew),
          },
          bottomNavigationBar: switch (bloc.state) {
            RuleEditorStateEdit(
              editState: StatusOfLoading() || StatusOfError(),
            ) =>
              null,
            _ => const _SaveButton(),
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.isNew,
  });

  final bool isNew;

  @override
  Widget build(final BuildContext context) {
    return SmoothMouseScroll(
      builder: (final context, final child, final controller, final physics) {
        return SingleChildScrollView(
          controller: controller,
          physics: physics,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Açıklama', style: smallTextStyle),
                SizedBox(height: 8),
                _Description(),
                SizedBox(height: 16),
                Text('Detaylar', style: smallTextStyle),
                SizedBox(height: 8),
                _Details(),
                SizedBox(height: 16),
                _Color(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton();

  @override
  Widget build(final BuildContext context) {
    final bloc = context.read<RuleEditorBloc>();

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: kToolbarHeight, height: kToolbarHeight),
      child: IconButton(
        icon: const Icon(Icons.delete),
        tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
        onPressed: () => bloc.add(const RuleEditorEventDeleteDialogOpened()),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(final BuildContext context) {
    late final RuleEditorBloc bloc;
    var isInitialized = false;
    final error = context.select((final RuleEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (newBloc.state) {
        RuleEditorStateCreate(
          :final descriptionError
        ) ||
        RuleEditorStateEdit(
          editState: StatusOfData(
            data: RuleEditorStateEditState(
              :final descriptionError,
            ),
          ),
        ) =>
          descriptionError,
        _ => '',
      };
    });
    final description = switch (bloc.state) {
      RuleEditorStateCreate(
        rule: Rule(
          :final description,
        ),
      ) ||
      RuleEditorStateEdit(
        editState: StatusOfData(
          data: RuleEditorStateEditState(
            rule: Rule(
              :final description,
            ),
          ),
        ),
      ) =>
        description,
      _ => '',
    };

    return TextFormField(
      decoration: InputDecoration(
        errorText: error,
      ),
      minLines: 1,
      maxLines: 8,
      initialValue: description,
      onChanged: (final value) => bloc.add(RuleEditorEventDescriptionChanged(value)),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details();

  @override
  Widget build(final BuildContext context) {
    final bloc = context.read<RuleEditorBloc>();
    final details = switch (bloc.state) {
      RuleEditorStateCreate(
        rule: Rule(
          :final details,
        ),
      ) ||
      RuleEditorStateEdit(
        editState: StatusOfData(
          data: RuleEditorStateEditState(
            rule: Rule(
              :final details,
            ),
          ),
        ),
      ) =>
        details,
      _ => '',
    };

    return TextFormField(
      minLines: 3,
      maxLines: 8,
      initialValue: details,
      onChanged: (final value) => bloc.add(RuleEditorEventDetailsChanged(value)),
    );
  }
}

class _Color extends StatefulWidget {
  const _Color();

  @override
  State<_Color> createState() => _ColorState();
}

class _ColorState extends State<_Color> {
  @override
  Widget build(final BuildContext context) {
    late final RuleEditorBloc bloc;
    var isInitialized = false;
    final color = context.select((final RuleEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (newBloc.state) {
        RuleEditorStateCreate(
          rule: Rule(
            :final color,
          ),
        ) ||
        RuleEditorStateEdit(
          editState: StatusOfData(
            data: RuleEditorStateEditState(
              rule: Rule(
                :final color,
              ),
            ),
          ),
        ) =>
          color,
        _ => Colors.red,
      };
    });
    final isLightTheme = Theme.of(context).brightness == Brightness.light;

    return ColorPicker(
      hasBorder: isLightTheme,
      wheelHasBorder: isLightTheme,
      wheelDiameter: 148,
      subheading: const SizedBox.shrink(),
      pickerTypeLabels: const {
        ColorPickerType.primary: 'Renk',
        ColorPickerType.wheel: 'Renk tonu',
      },
      pickersEnabled: const {
        ColorPickerType.wheel: true,
        ColorPickerType.accent: false,
      },
      enableShadesSelection: false,
      padding: EdgeInsets.zero,
      color: color,
      onColorChanged: (final value) => bloc.add(RuleEditorEventColorChanged(value)),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(final BuildContext context) {
    late final RuleEditorBloc bloc;
    var isInitialized = false;
    final uploadState = context.select((final RuleEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        RuleEditorStateCreate(
          :final uploadState
        ) ||
        RuleEditorStateEdit(
          editState: StatusOfData(
            data: RuleEditorStateEditState(
              :final uploadState,
            ),
          ),
        ) =>
          uploadState,
        _ => const OperationStatusInitial(),
      };
    });

    return SaveButton(
      isLoading: uploadState is OperationStatusInProgress,
      onPressed: () => bloc.add(const RuleEditorEventSaveRequested()),
    );
  }
}

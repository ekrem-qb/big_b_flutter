import 'package:auto_route/auto_route.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/entity/rule/rule.dart';
import '../../../entity/status.dart';
import '../../../theme.dart';
import '../../dialogs/delete_dialog.dart';
import '../../error_panel.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../extensions/snackbar.dart';
import '../../rule_tile.dart';
import '../../save_button.dart';
import '../../words_input.dart';
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
      key: ValueKey(id),
      create: (final context) => RuleEditorBloc(id: id, originalRule: rule),
      child: const RuleEditorView(isNew: false),
    );
  }
}

class RuleEditorView extends StatelessWidget {
  const RuleEditorView({required this.isNew, super.key});

  final bool isNew;

  @override
  Widget build(final BuildContext context) {
    final (bloc, _) = context.select(
      (final RuleEditorBloc bloc) => (
        bloc,
        switch (bloc.state) {
          RuleEditorStateEdit(:final editState) => editState.runtimeType,
          RuleEditorStateCreate() => null,
        },
      ),
    );

    return BlocListener<RuleEditorBloc, RuleEditorState>(
      listener: (final context, final state) async {
        switch (state) {
          case RuleEditorStateCreate(:final uploadState) ||
              RuleEditorStateEdit(
                editState: StatusOfData(
                  data: RuleEditorStateEditState(:final uploadState),
                ),
              ):
            switch (uploadState) {
              case OperationStatusCompleted():
                Navigator.pop(context);
              case OperationStatusError(:final error):
                showSnackbar(text: error.toString(), context: context);
              default:
            }
            switch (state) {
              case RuleEditorStateEdit(
                editState: StatusOfData(
                  data: RuleEditorStateEditState(:final deleteState),
                ),
              ):
                switch (deleteState) {
                  case OperationStatusCompleted():
                    Navigator.pop(context);
                  case OperationStatusError(:final error):
                    showSnackbar(text: error.toString(), context: context);
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
          actions: [if (!isNew) const _DeleteButton()],
        ),
        body: switch (bloc.state) {
          RuleEditorStateEdit(:final editState) => switch (editState) {
            StatusOfLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            StatusOfError(:final error) => ErrorPanel(
              error: error.toString(),
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
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.isNew});

  final bool isNew;

  @override
  Widget build(final BuildContext context) {
    final (bloc, _) = context.select(
      (final RuleEditorBloc bloc) => (
        bloc,
        switch (bloc.state) {
          RuleEditorStateCreate(rule: Rule(:final runtimeType)) ||
          RuleEditorStateEdit(
            editState: StatusOfData(
              data: RuleEditorStateEditState(rule: Rule(:final runtimeType)),
            ),
          ) => runtimeType,
          _ => null,
        },
      ),
    );

    final rule = switch (bloc.state) {
      RuleEditorStateCreate(:final rule) ||
      RuleEditorStateEdit(
        editState: StatusOfData(data: RuleEditorStateEditState(:final rule)),
      ) => rule,
      _ => const NameRule(id: -1, color: Colors.red),
    };

    return SmoothMouseScroll(
      builder: (final context, final child, final controller, final physics) {
        return SingleChildScrollView(
          controller: controller,
          physics: physics,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: AnimatedSize(
              duration: Durations.medium1,
              curve: Curves.easeInOutExpo,
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Tür', style: smallTextStyle),
                  const SizedBox(height: 8),
                  const _Type(),
                  ...?switch (rule) {
                    WordsRule() => [
                      const SizedBox(height: 16),
                      const Text('Kelimeler', style: smallTextStyle),
                      const SizedBox(height: 8),
                      const _Words(),
                    ],
                    NameRule() => null,
                    CustomRule() => [
                      const SizedBox(height: 16),
                      const Text('Açıklama', style: smallTextStyle),
                      const SizedBox(height: 8),
                      const _Description(),
                      const SizedBox(height: 16),
                      const Text('Detaylar', style: smallTextStyle),
                      const SizedBox(height: 8),
                      const _Details(),
                    ],
                  },
                  const SizedBox(height: 24),
                  const _Color(),
                ],
              ),
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
      constraints: const BoxConstraints.tightFor(
        width: kToolbarHeight,
        height: kToolbarHeight,
      ),
      child: IconButton(
        icon: const Icon(Icons.delete),
        tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
        onPressed: () async {
          if (await showDeleteDialog(itemName: 'kuralı', context: context)) {
            bloc.add(const RuleEditorEventDeleteRequested());
          }
        },
      ),
    );
  }
}

class _Type extends StatelessWidget {
  const _Type();

  @override
  Widget build(final BuildContext context) {
    final (bloc, type) = context.select(
      (final RuleEditorBloc bloc) => (
        bloc,
        switch (bloc.state) {
          RuleEditorStateCreate(:final rule) ||
          RuleEditorStateEdit(
            editState: StatusOfData(
              data: RuleEditorStateEditState(:final rule),
            ),
          ) => switch (rule) {
            WordsRule() => WordsRule,
            NameRule() => NameRule,
            CustomRule() => CustomRule,
          },
          _ => CustomRule,
        },
      ),
    );

    return DropdownButtonFormField(
      isExpanded: true,
      value: type,
      onChanged:
          (final value) => bloc.add(
            RuleEditorEventTypeChanged(switch (value!) {
              const (WordsRule) => const WordsRule(
                id: -1,
                words: {},
                color: Colors.red,
              ),
              const (NameRule) => const NameRule(id: -1, color: Colors.red),
              _ => const CustomRule(
                id: -1,
                description: '',
                details: '',
                color: Colors.red,
              ),
            }),
          ),
      items: const [
        DropdownMenuItem(value: WordsRule, child: RuleTileContent<WordsRule>()),
        DropdownMenuItem(value: NameRule, child: RuleTileContent<NameRule>()),
        DropdownMenuItem(
          value: CustomRule,
          child: RuleTileContent<CustomRule>(),
        ),
      ],
    );
  }
}

class _Words extends StatelessWidget {
  const _Words();

  @override
  Widget build(final BuildContext context) {
    final (bloc, words) = context.select(
      (final RuleEditorBloc bloc) => (
        bloc,
        switch (bloc.state) {
          RuleEditorStateCreate(rule: WordsRule(:final words)) ||
          RuleEditorStateEdit(
            editState: StatusOfData(
              data: RuleEditorStateEditState(rule: WordsRule(:final words)),
            ),
          ) => words,
          _ => Set<String>.unmodifiable({}),
        },
      ),
    );

    return Wrap(
      spacing: 8,
      runSpacing:
          Theme.of(context).materialTapTargetSize ==
                  MaterialTapTargetSize.shrinkWrap
              ? 8
              : 0,
      children: [
        for (final word in words)
          Chip(
            label: Text(word),
            deleteIcon: const Icon(Icons.cancel, size: 18),
            onDeleted: () => bloc.add(RuleEditorEventWordRemoved(word)),
          ),
        IconButton.filledTonal(
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.add),
          onPressed: () async {
            final newWords = await showWordsInput(context);
            if (newWords.isEmpty) return;

            bloc.add(RuleEditorEventWordsAdded(newWords));
          },
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(final BuildContext context) {
    final (bloc, error, description) = context.select((
      final RuleEditorBloc bloc,
    ) {
      return switch (bloc.state) {
        RuleEditorStateCreate(
          :final descriptionError,
          rule: CustomRule(:final description),
        ) ||
        RuleEditorStateEdit(
          editState: StatusOfData(
            data: RuleEditorStateEditState(
              :final descriptionError,
              rule: CustomRule(:final description),
            ),
          ),
        ) => (bloc, descriptionError, description),
        _ => (bloc, '', ''),
      };
    });

    return TextFormField(
      decoration: InputDecoration(errorText: error),
      minLines: 1,
      maxLines: 8,
      initialValue: description,
      onChanged:
          (final value) => bloc.add(RuleEditorEventDescriptionChanged(value)),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details();

  @override
  Widget build(final BuildContext context) {
    final bloc = context.read<RuleEditorBloc>();
    final details = switch (bloc.state) {
      RuleEditorStateCreate(rule: CustomRule(:final details)) ||
      RuleEditorStateEdit(
        editState: StatusOfData(
          data: RuleEditorStateEditState(rule: CustomRule(:final details)),
        ),
      ) => details,
      _ => '',
    };

    return TextFormField(
      minLines: 3,
      maxLines: 8,
      initialValue: details,
      onChanged:
          (final value) => bloc.add(RuleEditorEventDetailsChanged(value)),
    );
  }
}

class _Color extends StatelessWidget {
  const _Color();

  @override
  Widget build(final BuildContext context) {
    final (bloc, color) = context.select(
      (final RuleEditorBloc bloc) => (
        bloc,
        switch (bloc.state) {
          RuleEditorStateCreate(rule: Rule(:final color)) ||
          RuleEditorStateEdit(
            editState: StatusOfData(
              data: RuleEditorStateEditState(rule: Rule(:final color)),
            ),
          ) => color,
          _ => Colors.red,
        },
      ),
    );

    return ColorPicker(
      hasBorder: Theme.of(context).brightness == Brightness.light,
      pickersEnabled: const {ColorPickerType.accent: false},
      enableShadesSelection: false,
      padding: EdgeInsets.zero,
      color: color,
      onColorChanged:
          (final value) => bloc.add(RuleEditorEventColorChanged(value)),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(final BuildContext context) {
    final (bloc, uploadState) = context.select(
      (final RuleEditorBloc bloc) => (
        bloc,
        switch (bloc.state) {
          RuleEditorStateCreate(:final uploadState) ||
          RuleEditorStateEdit(
            editState: StatusOfData(
              data: RuleEditorStateEditState(:final uploadState),
            ),
          ) => uploadState,
          _ => const OperationStatusInitial(),
        },
      ),
    );

    return SaveButton(
      isLoading: uploadState is OperationStatusInProgress,
      onPressed: () => bloc.add(const RuleEditorEventSaveRequested()),
    );
  }
}

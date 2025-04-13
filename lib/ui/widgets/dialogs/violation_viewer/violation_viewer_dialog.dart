import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/entity/violation/violation.dart';
import '../../../../extensions/duration.dart';
import '../../../app_router/app_router.dart';
import '../../../entity/status.dart';
import '../../../theme.dart';
import '../../error_panel.dart';
import '../../extensions/auto_route_extension.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../rule_tile.dart';
import 'bloc/violation_viewer_bloc.dart';

@RoutePage()
class ViolationViewerDialog extends StatelessWidget {
  const ViolationViewerDialog({
    @pathParam required this.id,
    this.violation,
    super.key,
  });

  final int id;
  final Violation? violation;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      key: ValueKey(id),
      create: (final context) => ViolationViewerBloc(id, violation),
      child: const ViolationViewerView(),
    );
  }
}

class ViolationViewerView extends StatelessWidget {
  const ViolationViewerView({super.key});

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      content: SmoothMouseScroll(
        builder: (final context, final child, final controller, final physics) {
          return SingleChildScrollView(
            controller: controller,
            physics: physics,
            child: const _Violation(),
          );
        },
      ),
    );
  }
}

class _Violation extends StatelessWidget {
  const _Violation();

  @override
  Widget build(final BuildContext context) {
    final (bloc, _) = context.select(
      (final ViolationViewerBloc bloc) => (
        bloc,
        bloc.state.violation.runtimeType,
      ),
    );

    return switch (bloc.state.violation) {
      StatusOfData() => const _ViolationContent(),
      StatusOfLoading() => const Center(child: CircularProgressIndicator()),
      StatusOfError(:final error) => ErrorPanel(
        error: error.toString(),
        onRefresh: () => bloc.add(const ViolationViewerEventLoadRequested()),
      ),
    };
  }
}

class _ViolationContent extends StatelessWidget {
  const _ViolationContent();

  @override
  Widget build(final BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('İhlal edilen kural:', style: textTheme.titleMedium),
        const SizedBox(height: 8),
        const _Rule(),
        const SizedBox(height: 16),
        Text('İhlal yapılan yer:', style: textTheme.titleMedium),
        const SizedBox(height: 8),
        const _Text(),
      ],
    );
  }
}

class _Rule extends StatelessWidget {
  const _Rule();

  @override
  Widget build(final BuildContext context) {
    final rule = context.select((final ViolationViewerBloc bloc) {
      return switch (bloc.state.violation) {
        StatusOfData(:final data) => data.rule,
        _ => null,
      };
    });

    return rule != null
        ? Card(margin: EdgeInsets.zero, child: RuleTile(rule))
        : const SizedBox.shrink();
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(final BuildContext context) {
    final violation = context.select((final ViolationViewerBloc bloc) {
      return switch (bloc.state.violation) {
        StatusOfData(data: final violation) => violation,
        _ => null,
      };
    });
    final textTheme = TextTheme.of(context);

    return violation != null
        ? Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            borderRadius: kDefaultRadius,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: switch (violation) {
                NormalViolation() => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8,
                  children: [
                    Text(
                      violation.record.createdAt.toString(),
                      style: textTheme.bodyLarge,
                    ),
                    Text(violation.record.employee.name),
                  ],
                ),
                final HighlightViolation highlightViolation => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8,
                  children: [
                    _HighlightTitle(highlightViolation),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          violation.record.employee.name,
                          style: textTheme.labelSmall,
                        ),
                        Text(
                          violation.line.time.toMinutesAndSeconds(),
                          style: textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              },
            ),
            onTap: () {
              context.tabsRouter.navigateAll([
                const RecordingsRoute(),
                PlayerRoute(
                  recordingId: violation.record.id,
                  recording: violation.record,
                  textLineId: switch (violation) {
                    NormalViolation() => null,
                    HighlightViolation() => violation.line.id,
                  },
                ),
              ]);
            },
          ),
        )
        : const SizedBox.shrink();
  }
}

class _HighlightTitle extends StatelessWidget {
  const _HighlightTitle(this.violation);

  final HighlightViolation violation;

  @override
  Widget build(final BuildContext context) {
    final textTheme = TextTheme.of(context);

    return violation.startIndex >= violation.line.text.length ||
            violation.endIndex >= violation.line.text.length
        ? Text(violation.line.text, style: textTheme.bodyLarge)
        : Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: violation.line.text.substring(0, violation.startIndex),
              ),
              TextSpan(
                text: violation.line.text.substring(
                  violation.startIndex,
                  violation.endIndex,
                ),
                style: highlightedTextStyle(violation.rule.color),
              ),
              TextSpan(text: violation.line.text.substring(violation.endIndex)),
            ],
          ),
          style: textTheme.bodyLarge,
        );
  }
}

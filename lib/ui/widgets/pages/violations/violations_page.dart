import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/entity/rule/rule.dart';
import '../../../../api/entity/violation/violation.dart';
import '../../../../extensions/duration.dart';
import '../../../app_router/app_router.dart';
import '../../../entity/status.dart';
import '../../../theme.dart';
import '../../error_panel.dart';
import '../../extensions/dialog_router.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../list_view_shimmer.dart';
import '../../rule_tile.dart';
import 'bloc/violations_bloc.dart';

@RoutePage()
class ViolationsPage extends StatelessWidget {
  const ViolationsPage({
    @pathParam required this.id,
    this.violations,
    super.key,
  });

  final int id;
  final List<Violation>? violations;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      key: ValueKey(id),
      create: (final _) => ViolationsBloc(id: id, violations: violations),
      child: const ViolationsView(),
    );
  }
}

class ViolationsView extends StatelessWidget {
  const ViolationsView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('İhlaller'),
          ),
          body: const _List(),
        ),
        const DialogRouter(),
      ],
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(final BuildContext context) {
    late final ViolationsBloc bloc;
    var isInitialized = false;
    context.select((final ViolationsBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return bloc.state.violations.runtimeType;
    });

    return AnimatedSwitcher(
      duration: Durations.medium1,
      transitionBuilder: fadeTransitionBuilder,
      child: switch (bloc.state.violations) {
        StatusOfLoading() => const ListViewShimmer(),
        StatusOfData() => const _ViolationsListContent(),
        StatusOfError(
          :final error
        ) =>
          ErrorPanel(
            error: error,
            onRefresh: () => bloc.add(const ViolationsEventLoadRequested()),
          ),
      },
    );
  }
}

class _ViolationsListContent extends StatelessWidget {
  const _ViolationsListContent();

  @override
  Widget build(final BuildContext context) {
    final violations = context.select((final ViolationsBloc bloc) {
      return switch (bloc.state.violations) {
        StatusOfData(
          :final data,
        ) =>
          data,
        _ => List<Violation>.empty(),
      };
    });

    return violations.isEmpty
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                ),
                Text('İhlaller bulunamadı'),
              ],
            ),
          )
        : SmoothMouseScroll(
            builder: (final context, final child, final controller, final physics) {
              return ListView.builder(
                controller: controller,
                physics: physics,
                itemCount: violations.length,
                itemBuilder: (final context, final index) {
                  return Card(child: _Item(violations[index]));
                },
              );
            },
          );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.violation);

  final Violation violation;

  @override
  Widget build(final BuildContext context) {
    final subtitle = switch (violation.rule) {
      WordsRule(
        :final words
      ) =>
        words.join(', '),
      NameRule() => '',
      CustomRule(
        :final description,
        :final details
      ) =>
        switch (violation) {
          NormalViolation() => details,
          HighlightViolation() => '$description${details.isNotEmpty ? '\n$details' : ''}',
        },
    };

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultRadius,
        side: BorderSide(
          width: 2,
          color: violation.rule.color,
        ),
      ),
      leading: Icon(
        switch (violation.rule) {
          WordsRule() => RuleTileContent.iconOf<WordsRule>(),
          NameRule() => RuleTileContent.iconOf<NameRule>(),
          CustomRule() => RuleTileContent.iconOf<CustomRule>(),
        },
      ),
      title: switch (violation) {
        HighlightViolation(
          :final line,
          :final startIndex,
          :final endIndex,
          :final rule,
        ) =>
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: line.text.substring(0, startIndex),
                ),
                TextSpan(
                  text: line.text.substring(startIndex, endIndex),
                  style: TextStyle(color: rule.color, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: line.text.substring(endIndex),
                ),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        NormalViolation() => Text(
            switch (violation.rule) {
              WordsRule() => RuleTileContent.textOf<WordsRule>(),
              NameRule() => RuleTileContent.textOf<NameRule>(),
              CustomRule(
                :final description,
              ) =>
                description,
            },
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
      },
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      trailing: switch (violation) {
        HighlightViolation(
          :final line,
        ) =>
          Text(
            line.time.toMinutesAndSeconds(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        NormalViolation() => null,
      },
      onTap: () {
        context.pushRoute(
          ViolationViewerRoute(
            id: violation.id,
            violation: violation,
          ),
        );
      },
    );
  }
}

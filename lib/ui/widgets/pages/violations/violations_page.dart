import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../api/entity/rule/rule.dart';
import '../../../../api/entity/violation/violation.dart';
import '../../../../extensions/duration.dart';
import '../../../app_router/app_router.dart';
import '../../../theme.dart';
import '../../extensions/dialog_router.dart';
import '../../lister/lister_widget.dart';
import '../../rule_tile.dart';
import 'bloc/violations_bloc.dart';

@RoutePage()
class ViolationsPage extends StatelessWidget {
  const ViolationsPage({
    @pathParam this.id,
    this.violations,
    this.sortNewFirst = false,
    super.key,
  });

  final int? id;
  final List<Violation>? violations;
  final bool sortNewFirst;

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('İhlaller'),
          ),
          body: Lister.cards(
            key: ValueKey(id),
            blocCreator: () => ViolationsBloc(
              recordingId: id,
              violations: violations,
              sortNewFirst: sortNewFirst,
            ),
            itemContentBuilder: _Item.new,
            noItemsIcon: Icons.check_circle,
            noItemsText: 'İhlal bulunamadı',
          ),
        ),
        const DialogRouter(),
      ],
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

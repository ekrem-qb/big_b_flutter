import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../api/entity/rule/rule.dart';
import '../app_router/app_router.dart';
import '../theme.dart';

class RuleTile extends StatelessWidget {
  const RuleTile(this.rule, {super.key});

  final Rule rule;

  @override
  Widget build(final BuildContext context) {
    final subtitle = switch (rule) {
      WordsRule(
        :final words
      ) =>
        words.join(', '),
      NameRule() => '',
      CustomRule(
        :final details
      ) =>
        details,
    };
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultRadius,
        side: BorderSide(
          width: 2,
          color: rule.color,
        ),
      ),
      title: switch (rule) {
        WordsRule() => const RuleTileContent<WordsRule>(),
        NameRule() => const RuleTileContent<NameRule>(),
        CustomRule(
          :final description,
        ) =>
          Text(
            description,
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
      onTap: () => context.pushRoute(
        RuleEditorRoute(
          id: rule.id,
          rule: rule,
        ),
      ),
    );
  }
}

class RuleTileContent<T extends Rule> extends StatelessWidget {
  const RuleTileContent({
    super.key,
  });

  static String textOf<T extends Rule>() {
    return switch (T) {
      const (WordsRule) => 'Çalışan bu kelimeleri kullanıyor mu?',
      const (NameRule) => 'Çalışan kendi adını söyledi mi?',
      _ => 'Özel',
    };
  }

  static IconData iconOf<T extends Rule>() {
    return switch (T) {
      const (WordsRule) => Icons.abc,
      const (NameRule) => Icons.person,
      _ => Icons.auto_awesome,
    };
  }

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Icon(
          iconOf<T>(),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            textOf<T>(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

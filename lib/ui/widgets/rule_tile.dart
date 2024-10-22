import 'package:flutter/material.dart';

import '../../api/entity/rule/rule.dart';

class RuleTile extends StatelessWidget {
  const RuleTile({
    required this.type,
    super.key,
  });

  final Type type;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        RuleIcon(type: type),
        const SizedBox(width: 8),
        RuleText(type: type),
      ],
    );
  }
}

class RuleIcon extends StatelessWidget {
  const RuleIcon({
    required this.type,
    super.key,
  });

  final Type type;

  @override
  Widget build(final BuildContext context) {
    return Icon(
      switch (type) {
        const (WordsRule) => Icons.abc,
        const (NameRule) => Icons.person,
        _ => Icons.auto_awesome,
      },
    );
  }
}

class RuleText extends StatelessWidget {
  const RuleText({
    required this.type,
    super.key,
  });

  final Type type;

  @override
  Widget build(final BuildContext context) {
    return Text(
      switch (type) {
        const (WordsRule) => 'Çalışan bu kelimeleri kullanıyor mu?',
        const (NameRule) => 'Çalışan kendi adını söyledi mi?',
        _ => 'Özel',
      },
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

import 'package:bank_app/style/consts.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      height: 8,
      width: 55,
      decoration: BoxDecoration(
        color: _theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
    );
  }
}
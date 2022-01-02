import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key,required  double animationValue}) : _animationValue = animationValue, super(key: key);
  final double _animationValue;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return 
    Positioned.fill(
      child: Container(
        color: Color.lerp(Colors.white,_theme.colorScheme.secondary, _animationValue),
      )
    );
  }
}
import 'dart:ui';

import 'package:bank_app/style/consts.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({
    Key? key,
    required double height,
    required double percentWidgetBottom,
    required double visiblePercent,
    required double animationValue
  }) : _height = height, _percentWidgetBottom = percentWidgetBottom, _visiblePercent = visiblePercent, _animationValue = animationValue, super(key: key);

  final double _height;
  final double _percentWidgetBottom;
  final double _visiblePercent;
  final double _animationValue;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Positioned(
      left: 0,
      right: 0,
      height: _height * _percentWidgetBottom,
      bottom: lerpDouble(0, -_height, _animationValue),
      child: Opacity(
        opacity: _visiblePercent,
        child: Padding(
          padding: const EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding, bottom: defaultPadding/2),
          child: Row(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 60,
                  width: 60,
                  color: Colors.teal),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Next 30 Jun', style: TextStyle(fontSize: 14, color: _theme.colorScheme.primary.withOpacity(0.5), fontWeight: FontWeight.normal),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Netflix', style: TextStyle(fontSize: 20, color: _theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                          Text('-10.00', style: TextStyle(fontSize: 20, color: _theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
    );
  }
}
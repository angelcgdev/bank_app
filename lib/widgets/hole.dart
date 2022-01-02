import 'dart:ui';

import 'package:bank_app/style/consts.dart';
import 'package:flutter/material.dart';



class Hole extends CustomPainter {

  final double animationValue;
  final double initalHeight;
  final double topPosition;

  Hole({required this.animationValue, required this.initalHeight,required  this.topPosition});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    final left = lerpDouble(size.width-defaultPadding, size.width, animationValue)!;
    final right = lerpDouble(defaultPadding, 0, animationValue)!;
    final top = lerpDouble(topPosition, 0, animationValue)!;
    final bottom = lerpDouble(initalHeight+topPosition, size.height, animationValue)!;
    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRRect(RRect.fromLTRBR(0, 0, size.width, size.height, const Radius.circular(0))),
          Path()
            ..addRRect(RRect.fromLTRBR(left, top, right, bottom,Radius.circular(_inverValur(animationValue) *defaultRadius)))
            ..close(),
        ),
        paint,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;

  
  double _inverValur(double val){
    return 1.0-val;
  }

}
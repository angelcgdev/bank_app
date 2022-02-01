import 'dart:ffi';
import 'dart:ui';

import 'package:bank_app/data/cards.dart';
import 'package:bank_app/models/transaction.dart';
import 'package:bank_app/provider/card_selected.dart';
import 'package:bank_app/style/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final _heigth = _height * _percentWidgetBottom;
    return Positioned(
      left: 0,
      right: 0,
      height: _heigth,
      bottom: lerpDouble(0, -_height, _animationValue),
      child: Opacity(
        opacity: _visiblePercent,
        child: Consumer<CardSelected>(
          builder: (context, value, _) {
            late double progress;
            int index = 1;
            if(value.getCurrentPage>=1){
              final percent = value.nextCard - value.getCurrentPage;
              // de 0 a 1
              final reversepercent = value.getCurrentPage - value.prevCard;
              progress = percent>.5?percent:reversepercent;
              index = percent<.5? value.nextCard:value.prevCard;
            }else{
              progress = 1.0;
            }
            final _card = cards[index]!.transactions.first;
            // de 1 a 0
            return Opacity(
              opacity: progress,
              child: Transform.translate(
                offset: Offset(0.0, Tween<double>(begin: _heigth, end: 0.0).transform(progress)),
                child: _TransactionItem(transaction: _card)
              ),
            );
          },
        )),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  const _TransactionItem({Key? key,required this.transaction}) : super(key: key);
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    const _sizeImage = 60.0;
    final _isPerson = transaction.entity==TypeEntity.person;
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding, bottom: defaultPadding/2),
      child: Row(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: _sizeImage,
              width: _sizeImage,
              padding: EdgeInsets.all( _isPerson ? 0 : 15 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_isPerson ? _sizeImage*.5 : 10.0),
                color: _theme.colorScheme.primary.withOpacity(.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_isPerson ? _sizeImage*.5 : 10.0),
                child: Image.asset(transaction.pathImage)),
              ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(transaction.date, style: TextStyle(fontSize: 14, color: _theme.colorScheme.primary.withOpacity(0.5), fontWeight: FontWeight.normal),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(transaction.name, style: TextStyle(fontSize: 20, color: _theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                      Text(transaction.amount, style: TextStyle(fontSize: 20, color: _theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
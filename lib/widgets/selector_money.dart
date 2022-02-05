import 'package:flutter/material.dart';

class SelectorMoney extends StatelessWidget {
  SelectorMoney({
    Key? key,
    required double sizeMoney,
  })  : _sizeMoney = sizeMoney,
        super(key: key);

  final double _sizeMoney;

  final _initialPositionEur = 25.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _sizeMoney,
      width: _sizeMoney * 2,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        // child:
        layoutBuilder: (_, __) {
          return Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                right: _initialPositionEur,
                child: _MoneyIndicator(sizeMoney: _sizeMoney, simbol: '\$', transparence: 0.2),
              ),
              Positioned(
                left: _initialPositionEur,
                child: _MoneyIndicator(sizeMoney: _sizeMoney, simbol: '€', transparence: 1.0,),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MoneyIndicator extends StatelessWidget {
  const _MoneyIndicator({
    Key? key,
    required this.sizeMoney,
    required this.simbol,
    required this.transparence
  }) : super(key: key);

  final double sizeMoney;
  final String simbol;
  final double transparence;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      height: sizeMoney,
      width: sizeMoney,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sizeMoney * .5),
          color: _theme.primaryColor,
        ),
        child: Container(
          height: sizeMoney,
          width: sizeMoney,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeMoney * .5),
              color: Colors.white.withOpacity(transparence)),
          child: Center(child: Text(simbol, style: TextStyle(color: _theme.colorScheme.primary, fontWeight: FontWeight.bold),)),
        ),
    );
  }
}

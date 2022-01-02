import 'package:flutter/material.dart';

class SelectorMoney extends StatelessWidget {
  SelectorMoney({
    Key? key,
    required double sizeMoney,
  })  : _sizeMoney = sizeMoney,
        super(key: key);

  final double _sizeMoney;

  final _initialPositionEur = 25.0;

  final _moneyNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeMoney,
      child: SizedBox(
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
                ValueListenableBuilder<bool>(
                  valueListenable: _moneyNotifier,
                  builder: (context, value, _) {
                    return Positioned(
                      right: _initialPositionEur,
                      child: Container(
                        height: _sizeMoney,
                        width: _sizeMoney,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(_sizeMoney * .5),
                            color: value?Colors.white:Colors.yellowAccent),
                      ),
                    );
                  },
                ),
                Positioned(
                  left: _initialPositionEur,
                  child: Container(
                    height: _sizeMoney,
                    width: _sizeMoney,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_sizeMoney * .5),
                        color: Colors.red),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _changeMoney() {
    debugPrint('HOLAAAAAAAAA=========>');
    _moneyNotifier.value = !_moneyNotifier.value;
  }
}

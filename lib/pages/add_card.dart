import 'package:bank_app/style/consts.dart';
import 'package:bank_app/widgets/selector_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCard extends StatelessWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: _theme.colorScheme.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding/2, defaultPadding, defaultPadding),
            child: Column(
              children: [
                CardOptions(theme: _theme),
                const SizedBox(height: 15),
                IgnorePointer(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Your card number',
                      hintStyle: TextStyle(color: _theme.colorScheme.onSecondary),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, boxContrains){
                      final _remainingHeight = boxContrains.minHeight;
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: _remainingHeight/4,
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 9:
                              return SizedBox(
                              child: Center(
                                child: AspectRatio(
                                aspectRatio: 1,
                                child: Center(child: SvgPicture.asset('assets/scan.svg', color: _theme.colorScheme.onPrimary, height: 22,))
                                  )
                                )
                              );
                            case 10:
                              return const KeyCup(value: 0);
                            case 11:
                              return SizedBox(
                              child: Center(
                                child: AspectRatio(
                                aspectRatio: 1,
                                child: Center(child: SvgPicture.asset('assets/delete.svg', color: _theme.colorScheme.onPrimary, height: 22,))
                                  )
                                )
                              );
                            default:
                            return KeyCup(value: index+1);
                            }
                          }
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: (){},
                  child: const Text('Add Card'),
                  style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius*.5)),
                      primary: _theme.colorScheme.primaryVariant,
                      minimumSize: const Size(double.infinity, 70),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                  ),
                )
              ],
            ),
          )),
      ),
    );
  }
}

class CardOptions extends StatelessWidget {
  const CardOptions({
    Key? key,
    required ThemeData theme,
  }) : _theme = theme, super(key: key);

  final ThemeData _theme;
  final double _sizeMoney = 30;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        debugPrint('TEST2==>');
      },
      child: Container(
        padding: const EdgeInsets.all(defaultPadding*.8),
        decoration: BoxDecoration(
          color: _theme.colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(defaultRadius*.5)
        ),
        // width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/card.svg', width: 25),
                const SizedBox(width: defaultPadding/2),
                Text('Credit Card', style: _theme.textTheme.headline3?.copyWith(color: _theme.colorScheme.onPrimary)),
              ],
            ),
            const SizedBox( height: defaultPadding),
            Row(
              children: [
                SvgPicture.asset('assets/card2.svg', width: 25),
                const SizedBox(width: defaultPadding/2),
                Text('Open an account', style: _theme.textTheme.headline3?.copyWith(color: _theme.colorScheme.onPrimary)),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    debugPrint('TEST==>');
                  },
                  child: SelectorMoney(sizeMoney: _sizeMoney))
    
              ],
            )
          ],
        )
      ),
    );
  }
}


class KeyCup extends StatelessWidget {
  const KeyCup({
    Key? key,
    required int value,
  }) : _value = value, super(key: key);

  final int _value;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return SizedBox(
      child: Center(
        child: AspectRatio(
        aspectRatio: 1,
        child: Center(child: Text('$_value', style: _theme.textTheme.headline2?.copyWith(color: _theme.colorScheme.onPrimary), textAlign: TextAlign.center,))
          )
        )
      );
  }
}
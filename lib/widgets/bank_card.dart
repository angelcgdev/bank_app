import 'package:bank_app/models/bank_card.dart';
import 'package:bank_app/style/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BankCard extends StatelessWidget {
  const BankCard({Key? key, required BankCardModel data}) : _data = data, super(key: key);

  final BankCardModel _data;
  @override
  Widget build(BuildContext context) {
    // final _theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        image: DecorationImage(image: AssetImage(_data.background), fit: BoxFit.cover)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: SvgPicture.asset(_data.logo))),
              Text(_data.nroCard, style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: Color(_data.primaryColor)))
            ],
          ),
          Text('\$ ${_data.amount}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Color(_data.primaryVariant)),)
        ],
      ),
    );
  }
}
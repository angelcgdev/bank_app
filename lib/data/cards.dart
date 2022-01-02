import 'package:bank_app/models/bank_card.dart';

final cards = [
  null,
  BankCardModel(
    name: 'citi bank',
    logo: 'assets/citi_bank.svg',
    background: 'assets/citibank_background.jpg',
    nroCard: '0088',
    primaryColor: 0xff91a5a7,
    primaryVariant: 0xff000000,
    amount: 10346
  ),
  BankCardModel(
    name: 'bbva',
    logo: 'assets/bbva.svg',
    background: 'assets/bbva_background.jpg',
    primaryColor: 0xff5581f8,
    primaryVariant: 0xff020e47,
    nroCard: '0036',
    amount: 1036
  ),
];
import 'package:bank_app/models/bank_card.dart';
import 'package:bank_app/models/transaction.dart';

final cards = [
  null,
  BankCardModel(
    name: 'citi bank',
    logo: 'assets/citi_bank.svg',
    background: 'assets/citibank_background.jpg',
    nroCard: '0088',
    primaryColor: 0xff91a5a7,
    primaryVariant: 0xff000000,
    amount: 10346,
    transactions: [
      Transaction(
      pathImage: 'assets/netflix.png',
      name: 'Netflix',
      amount: '-10.00',
      date: 'Next 30 Jan',
      entity: TypeEntity.company,
    )
    ]
  ),
  BankCardModel(
    name: 'bbva',
    logo: 'assets/bbva.svg',
    background: 'assets/bbva_background.jpg',
    primaryColor: 0xff5581f8,
    primaryVariant: 0xff020e47,
    nroCard: '0036',
    amount: 1036,
    transactions: [
      Transaction(
        pathImage: 'assets/friends/profile5.png',
        name: 'Lelia Riley',
        amount: '+36.00',
        date: '@lelia',
        entity: TypeEntity.person,
      )
    ]
  ),
];
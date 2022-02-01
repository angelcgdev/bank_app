

import 'package:bank_app/models/transaction.dart';

class BankCardModel {
  final String name;
  final String logo;
  final String background;
  final String nroCard;
  final double amount;
  final int primaryColor;
  final int primaryVariant;
  final List<Transaction> transactions;

  BankCardModel({
    required this.name,
    required this.logo,
    required this.background,
    required this.nroCard,
    required this.amount,
    required this.primaryColor,
    required this.primaryVariant,
    required this.transactions,
  });
}
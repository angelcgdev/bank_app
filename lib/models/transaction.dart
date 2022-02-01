enum TypeEntity{
  person,
  company
}

class Transaction {
  final String pathImage;
  final TypeEntity entity;
  final String date;
  final String name;
  final String amount;
  Transaction({required this.pathImage, required this.entity, required this.date, required this.name, required this.amount});

}
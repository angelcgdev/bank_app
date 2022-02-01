import 'package:flutter/cupertino.dart';

class CardSelected with ChangeNotifier{

  int _cardSelected = 1;
  double _page = 1.0;
  

  int get getCurrentCard => _cardSelected;
  
  double get getCurrentPage => _page;

  int get nextCard => (_page+1).toInt();

  int get prevCard => _page.toInt();



  void changeCardSeletect (int index){
    _cardSelected = index;
    notifyListeners();
  }
  void changePage (double index){
    _page = index;
    notifyListeners();
  }

}
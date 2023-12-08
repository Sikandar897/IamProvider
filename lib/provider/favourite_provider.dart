import 'package:flutter/foundation.dart';

class FavouritItemProvider with ChangeNotifier{

  final List<int> _selectedItems= []; //this is a list array 

  List<int> get selectedItems => _selectedItems;

  void addItems(int value){
    _selectedItems.add(value);
    notifyListeners();
  }

  void removeItems(int value){
    _selectedItems.remove(value);
    notifyListeners();
  }

}
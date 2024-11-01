import 'package:flutter/material.dart';

class DishProvider with ChangeNotifier {
  int? selectedDishId;

  void selectDish(int id) {
    selectedDishId = id;
    notifyListeners();
  }
}

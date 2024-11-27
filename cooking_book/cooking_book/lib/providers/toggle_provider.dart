import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {


  bool isRecipe = false; 
  
  void isRecipeTrue() {
    if (isRecipe == false) {
      {
        isRecipe = true;
        notifyListeners();
      }
    }
  }

  void isRecipeFalse() {
    if (isRecipe == true) {
      {
        isRecipe = false;
        notifyListeners();
      }
    }
  }
}

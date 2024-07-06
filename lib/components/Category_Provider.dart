import 'package:flutter/material.dart';

class ItemCategory {
  String nameCate;
  String description;
  int unitCount;

  ItemCategory(this.nameCate, this.description,{this.unitCount = 0});
}

class CategoryProvider extends ChangeNotifier {
  List<ItemCategory> _Categories = [];

  List<ItemCategory> get Category => _Categories;

  void addCategory(String nameCate, String description) {
    _Categories.add(ItemCategory(nameCate, description));
    notifyListeners();
  }

  void updateCategory(int index, String nameCate, String description) {
    if (index >= 0 && index < _Categories.length) {
      _Categories[index] = ItemCategory(nameCate, description);
      notifyListeners();
    }
  }
  
  void deleteCategory(int index) {
    if (index >= 0 && index < _Categories.length) {
      _Categories.removeAt(index);
      notifyListeners();
    }
  }

  List<String> getCategoryNames() {
    return _Categories.map((category) => category.nameCate).toList();
  }

   void updateUnitCount(String categoryName, int increment) {
    var categoryIndex = _Categories.indexWhere((cat) => cat.nameCate == categoryName);
    if (categoryIndex != -1) {
      _Categories[categoryIndex].unitCount += increment;
      notifyListeners();
    }
  }
}

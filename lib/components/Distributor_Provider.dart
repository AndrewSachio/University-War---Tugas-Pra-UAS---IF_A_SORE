import 'package:flutter/material.dart';

class ItemDistributor {
  String nameDist;
  String address;
  String numberPhone;
  String email;
  String description;
  int unitCount;

  ItemDistributor(this.nameDist, this.address, this.numberPhone, this.email,
      this.description,{this.unitCount = 0});
}

class DistributorProvider extends ChangeNotifier {
  List<ItemDistributor> _Distributors = [];

  List<ItemDistributor> get Distributor => _Distributors;

  void addDistributor(String nameDist, String address, String numberPhone,
      String email, String description) {
    _Distributors.add(
        ItemDistributor(nameDist, address, numberPhone, email, description));
    notifyListeners();
  }

  void updateDistributor(int index, String nameDist, String address,
      String numberPhone, String email, String description) {
    if (index >= 0 && index < _Distributors.length) {
      _Distributors[index] =
          ItemDistributor(nameDist, address, numberPhone, email, description);
      notifyListeners();
    }
  }

  void deleteDistributor(int index) {
    if (index >= 0 && index < _Distributors.length) {
      _Distributors.removeAt(index);
      notifyListeners();
    }
  }

  List<String> getDistributorNames() {
    return _Distributors.map((distributor) => distributor.nameDist).toList();
  }

  void updateUnitCount(String distributorName, int increment) {
    var distributorIndex =
        _Distributors.indexWhere((dis) => dis.nameDist == distributorName);
    if (distributorIndex != -1) {
      _Distributors[distributorIndex].unitCount += increment;
      notifyListeners();
    }
  }
}

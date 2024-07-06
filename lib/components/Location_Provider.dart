import 'package:flutter/material.dart';

class ItemLocation {
  String nameLoca;
  String description;
  int unitCount;

  ItemLocation(this.nameLoca, this.description,{this.unitCount = 0});
}

class LocationProvider extends ChangeNotifier {
  List<ItemLocation> _Locations = [];

  List<ItemLocation> get Location => _Locations;

  void addLocation(String nameLoca, String description) {
    _Locations.add(ItemLocation(nameLoca, description));
    notifyListeners();
  }

  void updateLocation(int index, String nameLoca, String description) {
    if (index >= 0 && index < _Locations.length) {
      _Locations[index] = ItemLocation(nameLoca, description);
      notifyListeners();
    }
  }

  void deleteLocation(int index) {
    if (index >= 0 && index < _Locations.length) {
      _Locations.removeAt(index);
      notifyListeners();
    }
  }

  List<String> getLocationNames() {
    return _Locations.map((location) => location.nameLoca).toList();
  }

   void updateUnitCount(String locationName, int increment) {
    var locationIndex = _Locations.indexWhere((loc) => loc.nameLoca == locationName);
    if (locationIndex != -1) {
      _Locations[locationIndex].unitCount += increment;
      notifyListeners();
    }
  }
}

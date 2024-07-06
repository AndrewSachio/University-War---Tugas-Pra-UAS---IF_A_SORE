import 'package:flutter/material.dart';

class ItemRequest {
  String itemName;
  int quantity;
  String reason;
  bool isDepartmentRequest;
  String departmentName;
  String responsiblePerson;

  ItemRequest({
    required this.itemName,
    required this.quantity,
    required this.reason,
    required this.isDepartmentRequest,
    this.departmentName = '',
    this.responsiblePerson = '',
  });
}

class RequestProvider extends ChangeNotifier {
  List<ItemRequest> _requests = [];

  List<ItemRequest> get requests => _requests;

  void addRequest({
    required String itemName,
    required int quantity,
    required String reason,
    required bool isDepartmentRequest,
    String departmentName = '',
    String responsiblePerson = '',
  }) {
    _requests.add(ItemRequest(
      itemName: itemName,
      quantity: quantity,
      reason: reason,
      isDepartmentRequest: isDepartmentRequest,
      departmentName: departmentName,
      responsiblePerson: responsiblePerson,
    ));
    notifyListeners();
  }

  void deleteRequest(int index) {
    if (index >= 0 && index < _requests.length) {
      _requests.removeAt(index);
      notifyListeners();
    }
  }
}

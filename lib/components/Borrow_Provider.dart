import 'package:flutter/material.dart';

class BorrowRequest {
  final String username;
  final int amount;
  final DateTime startDate;
  final DateTime endDate;
  bool isAccepted;

  BorrowRequest({
    required this.username,
    required this.amount,
    required this.startDate,
    required this.endDate,
    this.isAccepted = false,
  });

  Duration get duration => endDate.difference(startDate);
}

class BorrowProvider with ChangeNotifier {
  List<BorrowRequest> _borrowRequests = [];

  List<BorrowRequest> get borrowRequests => _borrowRequests;

  void addBorrowRequest(BorrowRequest request) {
    _borrowRequests.add(request);
    notifyListeners();
  }

  void acceptRequest(int index) {
    _borrowRequests[index].isAccepted = true;
    notifyListeners();
  }

  void rejectRequest(int index) {
    _borrowRequests.removeAt(index);
    notifyListeners();
  }
}



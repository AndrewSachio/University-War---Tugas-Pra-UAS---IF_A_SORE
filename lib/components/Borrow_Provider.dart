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


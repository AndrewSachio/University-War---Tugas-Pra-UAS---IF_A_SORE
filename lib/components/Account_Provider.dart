import 'package:flutter/material.dart';

class Account {
  final String id;
  final String name;
  final String position;
  final String email;
  final String username;
  String passwordAcc;

  Account(this.id, this.name, this.position, this.email, this.username,
      this.passwordAcc);
}

class AccountProvider extends ChangeNotifier {
  List<Account> _accounts = [];

  List<Account> get accounts => _accounts;

  Account? _loggedInUser;

  Account? get loggedInUser => _loggedInUser;

  void setLoggedInUser(Account? user) {
    _loggedInUser = user;
    notifyListeners();
  }

  void addAccount(String id, String name, String position, String email,
      String username, String passwordAcc) {
    _accounts.add(Account(id, name, position, email, username, passwordAcc));
    notifyListeners();
  }

  bool isUsernameTaken(String username) {
    return _accounts.any((account) => account.username == username);
  }

  bool isEmailTaken(String email) {
    return _accounts.any((account) => account.email == email);
  }

  void updateLoggedInUser(
      String id, String name, String position, String email, String username) {
    if (_loggedInUser != null) {
      _loggedInUser = Account(
          id, name, position, email, username, _loggedInUser!.passwordAcc);
      notifyListeners();
    }
  }

  void updatePasswordByEmail(String email, String newPassword) {
    for (var account in _accounts) {
      if (account.email == email) {
        account.passwordAcc = newPassword;
        notifyListeners();
        return;
      }
    }
  }

  void deleteAccount(int index) {
    if (index >= 0 && index < _accounts.length) {
      _accounts.removeAt(index);
      notifyListeners();
    }
  }
}

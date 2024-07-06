import 'package:flutter/material.dart';

class DarkmodeProvider extends ChangeNotifier {
  static const Color lightBackgroundColor = Color.fromARGB(255, 151, 113, 99);
  static const Color darkBackgroundColor = Color.fromARGB(255, 59, 59, 59);

  var light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.brown,
    scaffoldBackgroundColor: lightBackgroundColor,
  );

  var dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.brown,
    scaffoldBackgroundColor: darkBackgroundColor,
  );

  bool _enableDarkMode = false;

  bool get enableDarkMode => _enableDarkMode;

  set setbrightness(bool val) {
    _enableDarkMode = val;
    notifyListeners();
  }

  ThemeData get currentTheme => _enableDarkMode ? dark : light;
}

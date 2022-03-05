import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  final ThemeData _greenTheme = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    appBarTheme: const AppBarTheme(color: Colors.green),
    textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  final ThemeData _redTheme = ThemeData(
    primarySwatch: Colors.red,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    appBarTheme: const AppBarTheme(color: Colors.red),
    textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  bool _isGreen = true;
  static SharedPreferences? _sharedPref;

  void switchTheme(bool selected) {
    _isGreen = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();
  }

  bool get isGreen => _isGreen;

  ThemeData get selectedThemeData => _isGreen ? _greenTheme : _redTheme;

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPref!.setBool('themeData', value);
  }

  void loadThemeFromSharedPref() {
    _isGreen = _sharedPref!.getBool('themeData') ?? true;
  }
}

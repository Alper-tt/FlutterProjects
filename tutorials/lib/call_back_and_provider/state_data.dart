import 'package:flutter/material.dart';

class StateData with ChangeNotifier {
  String sehir = 'İstanbul';

  void newCity(String newCity) {
    sehir = newCity;
    notifyListeners();
  }
}

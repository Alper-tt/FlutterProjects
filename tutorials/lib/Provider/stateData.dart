import 'package:flutter/material.dart';

class StateData with ChangeNotifier {
  String sehir = 'Adana';
  String ilce = 'Yenimahalle';
  String mahalle = 'Demetevler';

  void newCity(String city) {
    sehir = city;
    notifyListeners();
  }
}

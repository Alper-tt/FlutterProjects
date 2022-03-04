import 'package:flutter/material.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> items = [
    Item(title: 'Peynir al'),
    Item(title: 'Çöpü at'),
    Item(title: 'Fatura öde'),
    Item(title: 'Ekmek al'),
  ];

  void toggleStatus(int index) {
    items[index].toggleStatus();
    notifyListeners();
  }
}

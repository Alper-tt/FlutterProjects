import 'package:flutter/material.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> items = [
    Item(title: 'Peynir al'),
    Item(title: 'Copu at'),
    Item(title: 'Fatura öde'),
    Item(title: 'ekmek al'),
  ];

  void toggleStatus(int index) {
    items[index].toggleStatus();
    notifyListeners();
  }
}

import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
  ];

  static SharedPreferences? _sharedPref;
  List<String> _itemsAsString = [];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(title: title));
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemsToSharedPref(List<Item> items) {
    _itemsAsString.clear();

    for (var item in items) {
      _itemsAsString.add(jsonEncode(item.toMap()));
    }
    _sharedPref!.setStringList('toDoData', _itemsAsString);
  }

  void loadItemsFromSharedPref() async {
    List<String>? tempList = _sharedPref!.getStringList('toDoData')?? [];
    _items.clear();

    for (var item in tempList) {
      _items.add(Item.fromMap(jsonDecode(item)));
    }
  }
}

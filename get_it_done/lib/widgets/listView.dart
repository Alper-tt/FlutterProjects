import 'package:flutter/material.dart';

import '../models/items_data.dart';
import 'item_card.dart';

ListView listView(ItemData itemData) {
  return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      itemCount: itemData.items.length,
      itemBuilder: (BuildContext context, i) {
        return ItemCard(
          title: itemData.items[i].title,
          isDone: itemData.items[i].isDone,
          toggleStatus: (_) {
            itemData.toggleStatus(i);
          },
          deleteItem: (_) {
            itemData.deleteItem(i);
          },

        );
      });
}

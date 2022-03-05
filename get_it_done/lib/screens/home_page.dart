import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:get_it_done/screens/settings.dart';
import 'package:get_it_done/widgets/item_card.dart';
import 'package:provider/provider.dart';
import 'item_adder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: buildAppBar(context),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    '${Provider.of<ItemData>(context).items.length} items',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Consumer<ItemData>(
                        builder: (context, itemData, child) => Align(
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
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
                                  });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: buildFAB(context));
  }

  FloatingActionButton buildFAB(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(child: ItemAdder()),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)));
        },
        child: Icon(
          Icons.add,
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
        )
      ],
      centerTitle: true,
      title: Text('Get It Done'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:get_it_done/widgets/item_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Get It Done'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    '${Provider.of<ItemData>(context).items.length} items',
                    style: Theme.of(context).textTheme.subtitle1,
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
                      child: ListView.builder(
                        itemCount: Provider.of<ItemData>(context).items.length,
                        itemBuilder: (BuildContext context, i) {
                          return ItemCard(
                            title:
                                Provider.of<ItemData>(context).items[i].title,
                            isDone:
                                Provider.of<ItemData>(context).items[i].isDone,
                            toggleStatus: (_) {
                              Provider.of<ItemData>(context, listen: false)
                                  .toggleStatus(i);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Icon(
              Icons.add,
            )));
  }
}

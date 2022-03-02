import 'package:flutter/material.dart';
import 'package:get_it_done/widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Get It Done',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      '5 items',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, _) {
                          return ItemCard();
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

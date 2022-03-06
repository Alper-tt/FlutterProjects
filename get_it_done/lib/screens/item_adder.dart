import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                    minLines: 1,
                    maxLines: 3,
                    onChanged: (_) {
                    },
                    autofocus: true,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                    controller: myController,
                    decoration: InputDecoration(
                        labelText: 'Add Item',
                        hintText: 'Type a TO DO...',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(30)))),
              ),
              FlatButton(
                  onPressed: () {
                    Provider.of<ItemData>(context, listen: false)
                        .addItem(myController.text);
                    Navigator.pop(context);
                  },
                  child: Text('ADD'),
                  color: Theme.of(context).primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}

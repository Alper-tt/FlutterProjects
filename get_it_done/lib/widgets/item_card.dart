import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text('Flutter Dökümanlarını Oku',style: TextStyle(color: Colors.black),),
        trailing: Checkbox(onChanged: null, value: false,activeColor: Colors.green,),
      ),
    );
  }
}
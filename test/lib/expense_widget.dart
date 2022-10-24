import 'package:flutter/material.dart';

class expense_widget extends StatelessWidget {
  expense_widget({int? index});
  late int index;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            style: ListTileStyle.drawer,
            leading: Icon(
              Icons.music_note_outlined,
              color: Colors.yellow,
            ),
            title: Text("Spotify Premium"),
            subtitle: Text(
              "Subscription",
              style: TextStyle(fontSize: 13),
            ),
            trailing: RichText(
              textAlign: TextAlign.end,
              text: TextSpan(children: [TextSpan(text: "-9.99\$",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              TextSpan(text: "\n5.21PM",style: TextStyle(color: Colors.grey.shade500,fontSize: 10))]),
            ),
          );
        },
      ),
    );
  }
}

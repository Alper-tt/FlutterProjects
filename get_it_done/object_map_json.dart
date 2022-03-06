import 'dart:convert';

main() {
  
  Item itemObject = Item(title: 'uyu', isDone: true);

  Map<String,dynamic> itemAsMap = itemObject.toMap();


  String itemAsJson = jsonEncode(itemAsMap);



  itemAsMap = jsonDecode(itemAsJson);
  itemObject=Item.fromMap(itemAsMap);

}

class Item {
  String? title;
  bool? isDone;

  Item({this.title, this.isDone});

  Item.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        isDone = map['isDone'];

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}

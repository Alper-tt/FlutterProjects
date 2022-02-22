import 'package:flutter/material.dart';
import 'main.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var listitems = [
    ListTile(
      leading: Icon(Icons.abc),
      title: Text('1'),
    ),
    ListTile(
      leading: Icon(Icons.ac_unit),
      title: Text('2'),
    ),
    ListTile(
      leading: Icon(Icons.cabin),
      title: Text('3'),
    ),
    ListTile(
      leading: Icon(
        Icons.g_mobiledata,
      ),
      title: Text('4'),
    ),
    ListTile(
      leading: Icon(Icons.baby_changing_station),
      title: Text('5'),
    ),
    ListTile(
      leading: Icon(Icons.safety_divider),
      title: Text('6'),
    ),
    ListTile(
      leading: Icon(Icons.dangerous),
      title: Text('7'),
    ),
    ListTile(
      leading: Icon(Icons.h_mobiledata),
      title: Text('8'),
    ),
    ListTile(
      leading: Icon(Icons.javascript),
      title: Text('9'),
    ),
    ListTile(
      leading: Icon(Icons.face),
      title: Text('10'),
    ),
    ListTile(
      leading: Icon(Icons.label),
      title: Text('11'),
    ),
    ListTile(
      leading: Icon(Icons.ice_skating),
      title: Text('12'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text(
          'ListView Demo',
        ),
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(height: 5, color: Colors.pink);
          },
          padding: EdgeInsets.all(10),
          itemCount: listitems.length,
          itemBuilder: (context, index) {
            return listitems[index];
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it_done/screens/home_page.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool? isDone;
  final Function(bool?) toggleStatus;
  final Function(DismissDirection) deleteItem;

  ItemCard({
    required this.title,
    this.isDone,
    required this.toggleStatus,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      key: UniqueKey(),
      child: Card(
        color: isDone == true ? Colors.grey.shade300 : Colors.white,
        elevation: isDone == true ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: Edit(),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                decoration: isDone == true ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            onChanged: toggleStatus,
            value: isDone,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}

class Edit extends StatefulWidget {
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  bool isEditingText = false;
  TextEditingController? editingController;
  String initialText = 'title';

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    editingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text('Edit Task')),
                actions: <Widget>[
                  editTitleTextField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          setState(() {});
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  )
                ],
              );
            });
      },
    );
  }

  Widget editTitleTextField() {
    if (isEditingText) {
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              initialText = newValue;
              isEditingText = false;
            });
          },
          autofocus: true,
          controller: editingController,
        ),
      );
    }
    return InkWell(
        onTap: () {
          setState(() {
            isEditingText = true;
          });
        },
        child: Text(
          editingController!.text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ));
  }
}

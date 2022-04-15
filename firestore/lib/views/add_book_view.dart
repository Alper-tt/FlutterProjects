import 'package:firestore/services/calculator.dart';
import 'package:firestore/views/add_book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBookView extends StatefulWidget {
  const AddBookView({Key? key}) : super(key: key);

  @override
  _AddBookViewState createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
  TextEditingController bookCtr = TextEditingController();
  TextEditingController authorCtr = TextEditingController();
  TextEditingController publishCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _selectedDate;

  @override
  void dispose() {
    bookCtr.dispose();
    authorCtr.dispose();
    publishCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddBookViewModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: Text("Add New Book"),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: bookCtr,
                  decoration: InputDecoration(
                    hintText: "Book Name...",
                    icon: Icon(Icons.book),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Book name must not be empty.';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: authorCtr,
                  decoration: InputDecoration(
                    hintText: "Author Name...",
                    icon: Icon(Icons.edit),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Author name must not be empty.';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  onTap: () async {
                    _selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(-1000),
                        lastDate: DateTime.now());

                    publishCtr.text =
                        Calculator.dateTimeToString(_selectedDate!);
                  },
                  controller: publishCtr,
                  decoration: InputDecoration(
                    hintText: "Publish Date...",
                    icon: Icon(Icons.date_range),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select to pulish date.';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await context.read<AddBookViewModel>().addNewBook(
                            bookName: bookCtr.text,
                            authorName: authorCtr.text,
                            publishDate: _selectedDate);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Save'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

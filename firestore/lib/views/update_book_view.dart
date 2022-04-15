import 'package:firestore/views/update_book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book_model.dart';
import '../services/calculator.dart';

class UpdateBookView extends StatefulWidget {
  final Book book;

  const UpdateBookView({required this.book});

  @override
  _UpdateViewState createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateBookView> {
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
    bookCtr.text = widget.book.bookName;
    authorCtr.text = widget.book.authorName;
    publishCtr.text = Calculator.dateTimeToString(
        Calculator.datetimeFromTimestamp(widget.book.publishDate!));

    return ChangeNotifierProvider<UpdateBookViewModel>(
      create: (context) => UpdateBookViewModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: Text("Edit Book"),
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
                        await context.read<UpdateBookViewModel>().editBook(
                            bookName: bookCtr.text,
                            authorName: authorCtr.text,
                            publishDate: _selectedDate?? Calculator.datetimeFromTimestamp(widget.book.publishDate!),
                            book: widget.book);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Edit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

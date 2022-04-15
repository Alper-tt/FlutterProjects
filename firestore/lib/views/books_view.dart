import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/views/add_book_view.dart';
import 'package:firestore/views/books_view_model.dart';
import 'package:firestore/views/update_book_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book_model.dart';
import 'update_book_view.dart';

class BooksView extends StatefulWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<BooksView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BooksViewModel>(
      create: ((context) => BooksViewModel()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text("BOOK LİST"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Veriler",
                style: TextStyle(fontSize: 20),
              ),
              Divider(
                thickness: 10,
                height: 50,
                color: Colors.blue,
              ),
              StreamBuilder<List<Book>>(
                stream: Provider.of<BooksViewModel>(context, listen: false)
                    .getBookList(),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasError) {
                    return Center(
                      child: Text("Bir hata oluştu"),
                    );
                  } else {
                    if (!asyncSnapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<Book>? booksList = asyncSnapshot.data;

                      return Flexible(
                        child: ListView.builder(
                          itemCount: booksList!.length,
                          itemBuilder: (context, i) {
                            return Dismissible(
                              onDismissed: (_) async {
                                await Provider.of<BooksViewModel>(context,
                                        listen: false)
                                    .deleteBook(booksList[i]);
                              },
                              direction: DismissDirection.startToEnd,
                              background: Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                color: Colors.redAccent,
                              ),
                              key: UniqueKey(),
                              child: Card(
                                child: ListTile(
                                  trailing: IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdateBookView(
                                            book: booksList[i],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  title: Text(
                                    booksList[i].bookName,
                                  ),
                                  subtitle: Text(booksList[i].authorName),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddBookView()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

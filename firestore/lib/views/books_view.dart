import 'package:firestore/views/add_book_view.dart';
import 'package:firestore/views/books_view_model.dart';
import 'package:firestore/views/borrow_list_view.dart';
import 'package:firestore/views/update_book_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
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

                      return BuildListView(booksList: booksList);
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

class BuildListView extends StatefulWidget {
  const BuildListView({
    Key? key,
    required this.booksList,
  }) : super(key: key);

  final List<Book>? booksList;

  @override
  State<BuildListView> createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  bool isFiltering = false;
  List<Book>? filteredList;

  @override
  Widget build(BuildContext context) {
    List<Book>? fullList = widget.booksList;
    return Flexible(
      child: Column(
        children: [
          TextField(
              onChanged: (query) {
                if (query.isNotEmpty) {
                  isFiltering = true;

                  setState(() {
                    filteredList = fullList
                        ?.where((book) => book.bookName
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  });
                } else {
                  WidgetsBinding.instance!.focusManager.primaryFocus!.unfocus();
                  setState(() {
                    isFiltering = false;
                  });
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...')),
          Flexible(
            child: ListView.builder(
              itemCount: isFiltering ? filteredList?.length : fullList?.length,
              itemBuilder: (context, i) {
                var list = isFiltering ? filteredList : fullList;
                return Slidable(
                  key: UniqueKey(),
                  startActionPane: ActionPane(
                    extentRatio: 0.37,
                    motion: DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) async {
                          setState(() async {
                            await Provider.of<BooksViewModel>(context,
                                    listen: false)
                                .deleteBook(list![i]);
                          });
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        label: "Delete",
                      ),
                      SlidableAction(
                        onPressed: (_) async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateBookView(
                                book: list![i],
                              ),
                            ),
                          );
                        },
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: "Edit",
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                      extentRatio: 0.4,
                      motion: DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BorrowListView(
                                  book: list![i],
                                ),
                              ),
                            );
                          },
                          backgroundColor: Colors.blueAccent,
                          icon: Icons.perm_identity_outlined,
                          label: "Borrowed List",
                        ),
                      ]),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        list![i].bookName,
                      ),
                      subtitle: Text(list[i].authorName),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

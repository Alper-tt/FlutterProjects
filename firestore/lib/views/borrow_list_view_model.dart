import 'package:firestore/models/borrow_info_model.dart';
import 'package:firestore/services/database.dart';
import 'package:flutter/material.dart';

import '../models/book_model.dart';

class BorrowListViewModel with ChangeNotifier {
  DataBase _dataBase = DataBase();
  String collectionPath = 'books';
  updateBook({required Book book, required List<BorrowInfo> borrowList}) async {
    Book newBook = Book(
        id: book.id,
        bookName: book.bookName,
        authorName: book.authorName,
        publishDate: book.publishDate,
        borrows: borrowList);

    await _dataBase.setBookData(
        referencePath: collectionPath, bookAsMap: newBook.toMap());
  }
}

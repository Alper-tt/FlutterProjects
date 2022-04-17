import 'package:firestore/models/book_model.dart';
import 'package:firestore/services/calculator.dart';
import 'package:firestore/services/database.dart';
import 'package:flutter/foundation.dart';

class UpdateBookViewModel with ChangeNotifier {
  DataBase _dataBase = DataBase();
  String _collectionPath = 'books';

  Future<void> editBook(
      {required String bookName,
      required String authorName,
      required DateTime publishDate,
      required Book book}) async {
    Book editBook = Book(
      id: book.id,
      bookName: bookName,
      authorName: authorName,
      publishDate: Calculator.datetimeToTimeStamp(publishDate),
      borrows: book.borrows,
    );
    await _dataBase.setBookData(
        referencePath: _collectionPath, bookAsMap: editBook.toMap());
  }
}

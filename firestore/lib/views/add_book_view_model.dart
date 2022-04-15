import 'package:firestore/models/book_model.dart';
import 'package:firestore/services/calculator.dart';
import 'package:firestore/services/database.dart';
import 'package:flutter/foundation.dart';

class AddBookViewModel with ChangeNotifier {
  DataBase _dataBase = DataBase();
  String _collectionPath = 'books';

  Future<void> addNewBook(
      {required String bookName,
      required String authorName,
      required DateTime publishDate}) async {
    Book newBook = Book(
      id: DateTime.now().toIso8601String(),
      bookName: bookName,
      authorName: authorName,
      publishDate: Calculator.datetimeToTimeStamp(publishDate),
    );
    await _dataBase.setBookData(
        referencePath: _collectionPath, bookAsMap: newBook.toMap());
  }
}

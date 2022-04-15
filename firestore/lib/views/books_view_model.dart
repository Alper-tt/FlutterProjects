import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/services/database.dart';
import 'package:flutter/material.dart';

import '../models/book_model.dart';

class BooksViewModel with ChangeNotifier {
  /// bookview'ın state bilgisni kullanmak
  /// bookview arayüzünün ihtiyaci olan metotlari ve hesaplamaleri yapmak
  /// gerekli servislerle konuşmak

  final _collectionPath = 'books';
  final DataBase _dataBase = DataBase();

  /// stream<QuerySnapshot> --> Stream<List<DocumenSnapshot>>

  Stream<List<Book>> getBookList() {
    Stream<List<DocumentSnapshot>> streamListDocument = _dataBase
        .getBookListFromApi(_collectionPath)
        .map((querySnapshot) => querySnapshot.docs);

    /// stream<List<QuerySnapshot>> --> Stream<List<Book>>

    Stream<List<Book>> streamListBook = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) =>
                Book.fromMap(docSnap.data() as Map<String, dynamic>))
            .toList());

    return streamListBook;
  }

  Future<void> deleteBook(Book book) async {
   await _dataBase.deleteDocument(referencePath: _collectionPath, id: book.id);
  }
}

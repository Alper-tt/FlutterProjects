import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/book_model.dart';

class DataBase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getBookListFromApi(String referencePath) {
    return _firestore.collection(referencePath).snapshots();
  }

  Future<void> deleteDocument({referencePath, id}) async {
    await _firestore.collection(referencePath).doc(id).delete();
  }

  Future<void> setBookData(
      {referencePath, Map<String, dynamic>? bookAsMap}) async {
    await _firestore
        .collection(referencePath)
        .doc(Book.fromMap(bookAsMap!).id)
        .set(bookAsMap);
  }
}

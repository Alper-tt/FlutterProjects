import 'package:cloud_firestore/cloud_firestore.dart';
 
class Book {
  final String? id;
  final String bookName;
  final String authorName;
  final Timestamp? publishDate;

  Book({this.id, required this.bookName, required this.authorName, this.publishDate});

  Map<String, dynamic> toMap() => {
        'id': id,
        'bookName': bookName,
        'authorName': authorName,
        'publishDate': publishDate,
      };

  factory Book.fromMap(Map map) => Book(
        id: map['id'],
        bookName: map['bookName'],
        authorName: map['authorName'],
        publishDate: map['publishDate'],
      );

       
}

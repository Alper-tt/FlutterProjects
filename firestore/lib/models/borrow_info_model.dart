import 'package:cloud_firestore/cloud_firestore.dart';

class BorrowInfo {
  final String name;
  final String surname;
  final String? photoUrl;
  final Timestamp? borrowDate;
  final Timestamp? returnDate;

  BorrowInfo(
      {required this.name,
      required this.surname,
      this.photoUrl,
      this.borrowDate,
      this.returnDate});

  Map<String, dynamic> toMap() => {
        'name': name,
        'surname': surname,
        'photoUrl': photoUrl,
        'borrowDate': borrowDate,
        'returnDate': returnDate
      };

  factory BorrowInfo.fromMap(Map map) => BorrowInfo(
        name: map['name'],
        surname: map['surname'],
        photoUrl: map['photoUrl'],
        borrowDate: map['borrowDate'],
        returnDate: map['returnDate'],
      );
}
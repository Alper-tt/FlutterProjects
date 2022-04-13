import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({Key? key}) : super(key: key);

  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference booksRef = _database.collection('kitaplar');
    final DocumentReference duneRef = booksRef.doc('Dune');
    final CollectionReference oduncKayit = duneRef.collection('oduncKayıt');
    final DocumentReference metinRef = oduncKayit.doc('Metin');

    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud CRUD İşlemleri"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Veriler",
              style: TextStyle(fontSize: 20),
            ),
            Divider(thickness: 10, height: 50),
            StreamBuilder<QuerySnapshot>(
              stream: booksRef.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
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
                    List<DocumentSnapshot<Object?>>? booksList =
                        asyncSnapshot.data?.docs;

                    return Flexible(
                      child: ListView.builder(
                        itemCount: booksList!.length,
                        itemBuilder: (context, i) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                booksList[i].get('ad'),
                              ),
                              subtitle: Text(booksList[i].get('yazar')),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
            Consumer<QuerySnapshot?>(
              builder: ((context, querySnapshot, child) {
                if (querySnapshot == null) {
                  return CircularProgressIndicator();
                } else {
                  List<DocumentSnapshot> booksList = querySnapshot.docs;

                  return Flexible(
                    child: ListView.builder(
                      itemCount: booksList.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              booksList[i].get('ad'),
                            ),
                            subtitle: Text(booksList[i].get('yazar')),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

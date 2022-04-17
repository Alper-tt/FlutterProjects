import 'package:firestore/models/book_model.dart';
import 'package:firestore/models/borrow_info_model.dart';
import 'package:firestore/services/calculator.dart';
import 'package:firestore/views/borrow_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BorrowListView extends StatefulWidget {
  final Book book;

  const BorrowListView({Key? key, required this.book}) : super(key: key);

  @override
  _BorrowListViewState createState() => _BorrowListViewState();
}

Image avatar = Image.asset("assets/rte.jpeg");

class _BorrowListViewState extends State<BorrowListView> {
  @override
  Widget build(BuildContext context) {
    List<BorrowInfo> borrowList = widget.book.borrows as List<BorrowInfo>;
    return ChangeNotifierProvider(
      create: ((context) => BorrowListViewModel()),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: Text('${widget.book.bookName} Borrowed List'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(
                              '${borrowList[index].name} ${borrowList[index].surname}'),
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/rte.jpeg"),
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (context, _) => Divider(),
                    itemCount: borrowList.length),
              ),
              InkWell(
                  onTap: () async {
                    BorrowInfo? newBorrowInfo =
                        await showModalBottomSheet<BorrowInfo>(
                            builder: (BuildContext context) {
                              return BorrowForm();
                            },
                            context: context);
                    if (newBorrowInfo != null) {
                      setState(() {
                        borrowList.add(newBorrowInfo);
                      });
                      context.read<BorrowListViewModel>().updateBook(
                          book: widget.book, borrowList: borrowList);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 80,
                    color: Colors.blue,
                    child: Text(
                      "Add New Borrow",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class BorrowForm extends StatefulWidget {
  const BorrowForm({
    Key? key,
  }) : super(key: key);

  @override
  State<BorrowForm> createState() => _BorrowFormState();
}

class _BorrowFormState extends State<BorrowForm> {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController surnameCtr = TextEditingController();
  TextEditingController brwCtr = TextEditingController();
  TextEditingController rtrnCtr = TextEditingController();
  DateTime? brwDate;
  DateTime? rtrnDate;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameCtr.dispose();
    surnameCtr.dispose();
    brwCtr.dispose();
    rtrnCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Stack(
                        children: [
                          CircleAvatar(
                              backgroundImage: AssetImage("assets/rte.jpeg"),
                              radius: 40),
                          Positioned(
                            bottom: -5,
                            right: -10,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.photo_camera_rounded,
                                color: Colors.grey.shade100,
                                size: 26,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                        child: Column(
                      children: [
                        TextFormField(
                          controller: nameCtr,
                          decoration: InputDecoration(hintText: "Name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a name';
                            } else {
                              null;
                            }
                          },
                        ),
                        TextFormField(
                            controller: surnameCtr,
                            decoration: InputDecoration(hintText: "Surname"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a surname';
                              } else {
                                null;
                              }
                            }),
                      ],
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pick the borrow date';
                          } else {
                            null;
                          }
                        },
                        controller: brwCtr,
                        onTap: () async {
                          brwDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(Duration(days: 365)));
                          brwCtr.text = Calculator.dateTimeToString(brwDate!);
                        },
                        decoration: InputDecoration(
                            hintText: "Borrowing date",
                            prefixIcon: Icon(Icons.calendar_month)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pick the return date';
                            } else {
                              null;
                            }
                          },
                          controller: rtrnCtr,
                          onTap: () async {
                            rtrnDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)));

                            rtrnCtr.text =
                                Calculator.dateTimeToString(rtrnDate!);
                          },
                          decoration: InputDecoration(
                              hintText: "Return date",
                              prefixIcon: Icon(Icons.calendar_month))),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        BorrowInfo newBorrowInfo = BorrowInfo(
                            name: nameCtr.text,
                            surname: surnameCtr.text,
                            borrowDate:
                                Calculator.datetimeToTimeStamp(brwDate!),
                            returnDate:
                                Calculator.datetimeToTimeStamp(rtrnDate!));

                        Navigator.pop(context, newBorrowInfo);
                      }
                    },
                    child: Text("Add Borrow"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key, required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: CupertinoTextField(
        placeholder: title,
        placeholderStyle: TextStyle(color: Colors.grey.shade600),
        prefix: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.search,
            color: Colors.grey.shade600,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

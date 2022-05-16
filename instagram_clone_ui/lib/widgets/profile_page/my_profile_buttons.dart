import 'package:flutter/material.dart';

class MyProfileButtons extends StatelessWidget {
  const MyProfileButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 15),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Edit profile",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 105),
                    primary: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(7))),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.person_add_alt_1_outlined, color: Colors.black),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(7))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

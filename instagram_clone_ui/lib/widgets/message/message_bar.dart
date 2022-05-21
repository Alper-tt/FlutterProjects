import 'package:flutter/material.dart';

class MessageBar extends StatelessWidget {
  const MessageBar(
      {Key? key,
      required this.image,
      required this.profileName,
      required this.lastMessage,
      required this.lastMessageTime})
      : super(key: key);

  final String image;
  final String profileName;
  final String lastMessage;
  final String lastMessageTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 27,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profileName,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.end,
                  
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text("$lastMessage · $lastMessageTime",style: TextStyle(color: Colors.grey.shade600),),
                ),
              ],
            ),
          ),
            ],
          ),
        ),
        Icon(Icons.camera_alt_outlined, color: Color.fromARGB(255, 8, 8, 8)),
      ],
    );
  }
}

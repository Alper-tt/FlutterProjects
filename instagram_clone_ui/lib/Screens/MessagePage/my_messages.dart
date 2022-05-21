import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/widgets/message/message_bar.dart';

class Messages with ChangeNotifier {
  List<Widget> messageList = [
    MessageBar(
        image: "assets/story_photos/alican.png",
        profileName: "Alican Kaya",
        lastMessage: "Shared a post",
        lastMessageTime: "3h"),
    MessageBar(
        image: "assets/story_photos/arda.png",
        profileName: "Arda Topraktepe",
        lastMessage: "asjdhakdalkn",
        lastMessageTime: "1d"),
    MessageBar(
        image: "assets/story_photos/burcu.png",
        profileName: "Burcu Sana",
        lastMessage: "Bi yorumunu alırım 😂",
        lastMessageTime: "2d"),
    MessageBar(
        image: "assets/story_photos/ibrahim.png",
        profileName: "Ibrahim Sana",
        lastMessage: "Seen last week",
        lastMessageTime: "7d"),
    MessageBar(
        image: "assets/story_photos/berat.png",
        profileName: "Berat Sana",
        lastMessage: "Mentioned you in a story",
        lastMessageTime: "1w"),
    MessageBar(
        image: "assets/story_photos/berk.png",
        profileName: "Berk Sana",
        lastMessage: "Liked a message",
        lastMessageTime: "2w"),
    MessageBar(
        image: "assets/story_photos/yusuf.png",
        profileName: "Yusuf Kavvasoğlu",
        lastMessage: "😅😅",
        lastMessageTime: "2w"),
    MessageBar(
        image: "assets/story_photos/nas.png",
        profileName: "Nas Dik",
        lastMessage: "jsahdkjasdkjas",
        lastMessageTime: "3w"),
         MessageBar(
        image: "assets/story_photos/ahmet.png",
        profileName: "Ahmet Esat Albuz",
        lastMessage: "Liked a message",
        lastMessageTime: "3w")
  ];
}

import 'package:flutter/material.dart';

import '../../widgets/posts/home_posts.dart';

class Posts with ChangeNotifier {
  List<Widget> postList = [
    Post(
        personProfilePhoto: "assets/story_photos/myprofile.png",
        personName: "alper.t.t",
        location: "Netherlands",
        personPost: "assets/post_photos/mypost.png",
        numberOfLikes: "142",
        timeText: "25 minutes ago",
        personalComment:
            '"Everyone gonna die and no one is gonna remember you, so fuck it!"',
        personalCommentIcon: "assets/story_photos/myprofile.png"),
    Post(
        personProfilePhoto: "assets/story_photos/ibrahim.png",
        personName: "1ibrahimsana",
        location: "Ataşehir",
        personPost: "assets/post_photos/ibrahimpost.png",
        numberOfLikes: "136",
        timeText: "1 day ago",
        personalComment: "🌕",
        personalCommentIcon: "assets/story_photos/ibrahim.png"),
    Post(
        personProfilePhoto: "assets/story_photos/arda.png",
        personName: "arda.t.t",
        location: "Heybeli Ada",
        personPost: "assets/post_photos/ardapost.png",
        numberOfLikes: "158",
        timeText: "3 days ago",
        personalComment: "👌",
        personalCommentIcon: "assets/story_photos/arda.png"),
    Post(
        personProfilePhoto: "assets/story_photos/alican.png",
        personName: "kayaalican",
        location: "Ümraniye",
        personPost: "assets/post_photos/alicanpost.png",
        numberOfLikes: "106",
        timeText: "21 hours ago",
        personalComment: '"O kadar gurulanma; O kadar mağrur olma..."',
        personalCommentIcon: "assets/story_photos/ibrahim.png"),
    Post(
        personProfilePhoto: "assets/story_photos/erkek.png",
        personName: "erkeklerinicsesi",
        location: "Sponsored",
        personPost: "assets/post_photos/erkekpost.png",
        numberOfLikes: "2568",
        timeText: "2 days ago",
        personalComment: "Böyle arkadaşlarını etiketle 😅 👇",
        personalCommentIcon: "assets/story_photos/erkek.png"),
    Post(
        personProfilePhoto: "assets/story_photos/burcu.png",
        personName: "burcusanaa",
        location: "Beşiktaş",
        personPost: "assets/post_photos/burcupost.png",
        numberOfLikes: "369",
        timeText: "15 hours ago",
        personalComment: "Sunset 🌆",
        personalCommentIcon: "assets/story_photos/burcu.png"),
    Post(
        personProfilePhoto: "assets/story_photos/yusuf.png",
        personName: "kavvasoglujosef",
        location: "Era Palace",
        personPost: "assets/post_photos/yusufpost.png",
        numberOfLikes: "351",
        timeText: "1 day ago",
        personalComment:
            '"Raks ediyor isyanla çocuklar,\nÇocukların isyan çığlıkları,\nBastırıyor soytarıların sesini."',
        personalCommentIcon: "assets/story_photos/yusufpost.png"),
  ];
}

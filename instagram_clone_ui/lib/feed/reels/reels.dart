import 'package:flutter/material.dart';

import '../../widgets/reels/reels_content.dart';

class Reels with ChangeNotifier {
  List<Widget> ReelsList = [
    ReelsContent(
        favNumbers: "673",
        commentNumbers: "25",
        profileImage: "assets/story_photos/burcu.png",
        profileName: "burcusanaa",
        personalComment: "#Karadeniz #Ordu",
        music: "Recebim · Ben Karadenizliyim"),
    ReelsContent(
        favNumbers: "348",
        commentNumbers: "15",
        profileImage: "assets/story_photos/arda.png",
        profileName: "arda.t.t",
        personalComment: "Kimse şoförlüğümü sorgulamasın.😅",
        music: ""),
    ReelsContent(
        favNumbers: "256",
        commentNumbers: "49",
        profileImage: "assets/story_photos/alican.png",
        profileName: "kayaalican",
        personalComment: "Filmin sonu dönüp dolaşıp yine aynı yere geldik…",
        music: "maNga · Yine Yeni Yeniden"),
    ReelsContent(
        favNumbers: "452",
        commentNumbers: "23",
        profileImage: "assets/story_photos/yusuf.png",
        profileName: "kavvasoglujosef",
        personalComment: "Ticking away the moments that make up a dull day",
        music: "Pink Floyd · Time"),
    ReelsContent(
        favNumbers: "124",
        commentNumbers: "14",
        profileImage: "assets/story_photos/ibrahim.png",
        profileName: "1ibrahimsana",
        personalComment: "🌳 🌳 🌳",
        music: ""),
  ];
}

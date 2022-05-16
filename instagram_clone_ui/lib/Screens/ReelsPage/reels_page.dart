import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/feed/reels/reels.dart';
import 'package:instagram_clone_ui/widgets/reels/video_widget.dart';
import 'package:provider/provider.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  _ReelsPageState createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> reelsList = Provider.of<Reels>(context).ReelsList;
    print(reelsList);
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) {
              return SizedBox(
                  child: Stack(children: [
                VideoWidget(videoUrl: "assets/reels_videos/reel_${index+1}.mp4"),
                reelsList[index]
              ]));
            }));
  }
}

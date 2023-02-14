import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:travel_tog_ui/Widgets/linear_rate_bar.dart';
import 'package:travel_tog_ui/Constants.dart' as constants;

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 300,
                width: 300,
                color: Colors.red,
                child: Icon(Icons.abc),
              );
            });
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            child: Image.asset("assets/images/ca.png"),
                            radius: 20,
                          ),
                        ),
                        Text("CoderNomad", style: constants.UserNameTextStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          "Şavşat, Artvin",
                          style: constants.LocationTextStyle,
                        ),
                      ],
                    ),
                    LinearRateBar(
                      icon: Icons.fastfood_rounded,
                      rate: 0.7,
                    ),
                    LinearRateBar(
                      icon: Icons.hotel_rounded,
                      rate: 0.8,
                    ),
                    LinearRateBar(
                      icon: Icons.directions_walk,
                      rate: 0.6,
                    ),
                    LinearRateBar(
                      icon: Icons.emoji_transportation_rounded,
                      rate: 0.8,
                    ),
                    LinearRateBar(
                      icon: Icons.forest_rounded,
                      rate: 0.8,
                    ),
                    LinearRateBar(
                      icon: Icons.price_change_outlined,
                      rate: 0.3,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(194, 255, 128, 0), width: 2),
                      ),
                      height: 200,
                      width: 200,
                      child: CarouselSlider(
                        items: [
                          Image.asset("assets/images/1.png",
                              filterQuality: FilterQuality.high),
                          Image.asset("assets/images/2.png",
                              filterQuality: FilterQuality.high),
                          Image.asset("assets/images/3.png",
                              filterQuality: FilterQuality.high),
                          Image.asset("assets/images/4.png",
                              filterQuality: FilterQuality.high),
                        ],
                        options: CarouselOptions(
                          pauseAutoPlayInFiniteScroll: false,
                          viewportFraction: 0.8,
                          aspectRatio: 10 / 10,
                          autoPlay: true,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LikeButton(
                  likeCountAnimationType: LikeCountAnimationType.all,
                  likeCount: 0,
                  countBuilder: (Count, isLiked, text) {
                    Widget result;
                    if (Count == 0) {
                      result = Text(
                        "like",
                        style: GoogleFonts.inter(color: Colors.red),
                      );
                    } else
                      result = Text(
                        text,
                        style: GoogleFonts.inter(color: Colors.red),
                      );
                    return result;
                  },
                ),
                LikeButton(
                  likeBuilder: (isLiked) {
                    return Icon(
                      Icons.mode_comment_rounded,
                      color: isLiked
                          ? Colors.deepOrangeAccent
                          : Colors.grey.shade500,
                    );
                  },
                  likeCount: 0,
                  countBuilder: (count, bool isCommented, String text) {
                    var color = isCommented ? Colors.orange : Colors.red;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "comment",
                        style: TextStyle(color: color),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(color: color),
                      );
                    return result;
                  },
                )
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class image_slider extends StatelessWidget {
  const image_slider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          height: 10,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/1.png"),
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/2.png"),
                filterQuality: FilterQuality.high),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/3.png"),
                filterQuality: FilterQuality.high),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/4.png"),
                filterQuality: FilterQuality.high),
          ),
        ),
      ],
      options: CarouselOptions(
        autoPlayCurve: Curves.easeOutQuart,
        enlargeFactor: 0.3,
        enlargeCenterPage: true,
        pauseAutoPlayInFiniteScroll: false,
        viewportFraction: 0.8,
        aspectRatio: 10 / 10,
        autoPlay: true,
      ),
    );
  }
}

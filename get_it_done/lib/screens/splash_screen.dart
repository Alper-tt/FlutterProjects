
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home_page.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomePage(),
      duration: 3000,
      imageSize: 250,
      imageSrc: "assets/splash_image.png",
      text: "GET IT DONE!",
      textType: TextType.TyperAnimatedText,
      pageRouteTransition: PageRouteTransition.SlideTransition,
      textStyle: TextStyle(
        color: Colors.green[500],
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
      ),
      backgroundColor: Colors.blueGrey[100],
    );
  }
}
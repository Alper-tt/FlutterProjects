import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageAppBar {
  AppBar appBar = AppBar(
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.notifications),
        color: Colors.black,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.black,
          foregroundImage: AssetImage("assets/images/ca.png"),
        ),
      ),
    ],
    leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        )),
    elevation: 0,
    backgroundColor: Color.fromRGBO(0, 0, 0, 255),
    centerTitle: true,
    title: Text(
      "TravelTog",
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
}

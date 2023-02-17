import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:travel_tog_ui/Widgets/image_slider.dart';

import '../Widgets/PropertiesListTile.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          color: Color.fromRGBO(0, 0, 0, 245)),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  backgroundColor: Colors.grey.shade400,
                  barRadius: Radius.circular(20),
                  width: 100,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: image_slider(),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        "Şavşat, Artvin - Türkiye",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Aliquam convallis vulputate eu luctus dignissim erat felis. Platea aliquet urna urna in feugiat mi amet consequat rhoncus. Facilisi interdum feugiat enim in semper. Ut sit eros vitae ornare commodo in urna nulla pretium. Eleifend vitae amet dignissim.",
                  style: GoogleFonts.montserrat(),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  PropertiesListTile(text: "Food", rate: 4),
                  PropertiesListTile(
                    text: "Staying",
                    rate: 2,
                  ),
                  PropertiesListTile(text: "Activities", rate: 4),
                  PropertiesListTile(
                    text: "Transportation",
                    rate: 3,
                  ),
                  PropertiesListTile(
                    text: "Nature",
                    rate: 3,
                  ),
                  PropertiesListTile(
                    text: "Pricing",
                    rate: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

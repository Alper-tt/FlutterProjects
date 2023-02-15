import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertiesListTile extends StatelessWidget {
  const PropertiesListTile({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 20),
      child: ListTile(
        title: Text(
          this.text,
          style: GoogleFonts.montserrat(fontSize: 15),
        ),
        trailing: RatingBar(
            itemSize: 30,
            ratingWidget: RatingWidget(
                full: Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                half: Icon(Icons.star),
                empty: Icon(
                  Icons.star,
                )),
            onRatingUpdate: (_) {}),
      ),
    );
  }
}

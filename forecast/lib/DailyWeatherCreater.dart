import 'package:flutter/material.dart';

class DailyWeather extends StatelessWidget {
  final String? image;
  final int? temp;
  final String? date;

  DailyWeather(
      {Key? key,
      @required this.image,
      @required this.temp,
      @required this.date})
      : super(key: key);

  @override


  Widget build(BuildContext context) {

  List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    String weekday = weekdays[DateTime.parse(date!).weekday-1];

    return Card(
      color: Colors.transparent,
      elevation: 2,
      child: Container(
        height: 120,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://www.metaweather.com/static/img/weather/png/$image.png',
              height: 50,
              width: 50,
            ),
            Text('$temp° C'),
            Text(weekday),
          ],
        ),
      ),
    );
  }
}

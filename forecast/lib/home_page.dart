import 'package:flutter/material.dart';
import 'package:forecast/search_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

import 'DailyWeatherCreater.dart';
import 'lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? city;
  double? temprature;
  var weatherData;
  var locationData;
  var woeid;
  var weather_state;
  var weather_abbr = 't';
  var date;
  Position? position;
  LocationPermission? permission;


  var spinkit = SpinKitRipple(
    color: Colors.cyan,
    size: 50,
  );

  Future<void> getDevicePosition() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (error) {
      print('$error');
    }
  }

  Future<void> getLocationData() async {
    locationData = await http.get(Uri.parse(
        'https://www.metaweather.com/api/location/search/?query=$city'));
    var locationDataParsed = jsonDecode(locationData.body);
    woeid = locationDataParsed[0]['woeid'];
    city = locationDataParsed[0]['title'];
  }

  Future<void> getLocationDataLattLong() async {
    locationData = await http.get(Uri.parse(
        'https://www.metaweather.com/api/location/search/?lattlong=${position!.latitude},${position!.longitude}'));
    var locationDataParsed = jsonDecode(utf8.decode(locationData.bodyBytes));
    woeid = locationDataParsed[0]['woeid'];
    city = locationDataParsed[0]['title'];
  }

  Future<void> getWeatherData() async {
    weatherData = await http
        .get(Uri.parse('https://www.metaweather.com/api/location/$woeid/'));
    var weatherDataParsed = jsonDecode(weatherData.body);
    weather_state =
        weatherDataParsed['consolidated_weather'][0]['weather_state_name'];

    setState(() {
      date = weatherDataParsed['consolidated_weather'][0]['applicable_date'];
      temprature = weatherDataParsed['consolidated_weather'][0]['the_temp'];

      for (int a = 0; a < 5; a++) {
        temps[a] = weatherDataParsed['consolidated_weather'][a + 1]['the_temp'];
        abbrs[a] = weatherDataParsed['consolidated_weather'][a + 1]
            ['weather_state_abbr'];
        dates[a] =
            weatherDataParsed['consolidated_weather'][a + 1]['applicable_date'];
      }

      weather_abbr =
          weatherDataParsed['consolidated_weather'][0]['weather_state_abbr'];
    });
  }

  Future<void> getDataFromAPI() async {
    await getDevicePosition();
    await getLocationDataLattLong();
    getWeatherData();
  }

  Future<void> getDataFromAPIbyCity() async {
    await getLocationData();
    getWeatherData();
  }

  Future<void> checkAndRequestLocationAccess() async {
    await Geolocator.requestPermission();
    print(Geolocator.requestPermission);
    await getDataFromAPI();
  }

  @override
  void initState() {
    getDataFromAPI();
    checkAndRequestLocationAccess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/$weather_abbr.jpg'))),
      child: temprature == null
          ? Center(child: spinkit)
          : Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.network(
                          'https://www.metaweather.com/static/img/weather/png/$weather_abbr.png'),
                    ),
                    Text(
                      '${temprature?.round()}° C',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 70,
                          shadows: <Shadow>[
                            Shadow(
                                color: Colors.black38,
                                blurRadius: 5,
                                offset: Offset(1, 1))
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$city',
                          style: TextStyle(fontSize: 30, shadows: <Shadow>[
                            Shadow(
                                color: Colors.black38,
                                blurRadius: 5,
                                offset: Offset(1, 1))
                          ]),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () async {
                            city = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchPage()));
                            getDataFromAPIbyCity();
                            setState(() {
                              city = city;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildDailyWeatherCards(context)
                  ],
                ),
              ),
            ),
    );
  }

  Container buildDailyWeatherCards(BuildContext context) {
    


    for (int a = 0; a < cards.length; a++) {
      cards[a] =
          DailyWeather(image: abbrs[a], temp: temps[a].round(), date: dates[a]);
    }

    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }
}

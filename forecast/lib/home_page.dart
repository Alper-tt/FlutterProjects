import 'package:flutter/material.dart';
import 'package:forecast/search_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = 'Istanbul';
  double? temprature;
  var weatherData;
  var locationData;
  var woeid;
  var weather_state;
  var weather_abbr = 'c';
  Position? position;
  var spinkit = SpinKitRipple(
    color: Colors.cyan,
    size: 50,
  );

  Future<void> getDevicePosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
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
      temprature = weatherDataParsed['consolidated_weather'][0]['the_temp'];
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
  




  @override
  void initState() {
    getDataFromAPI();

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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

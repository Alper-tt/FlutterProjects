import 'package:flutter/material.dart';
import 'package:forecast/search_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = 'Ankara';
  int temprature = 20;
  var locationData;

  Future<void> getLocationData() async {
    locationData = await http.get(Uri.parse(
        'https://www.metaweather.com/api/location/search/?query=Ankara'));
    var locationDataParsed = jsonDecode(locationData.body);
    woeid = locationDataParsed[0]['woeid'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/c.jpg'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () async {
                    await getLocationData();
                    print(woeid);
                  },
                  child: Text(
                    'getLocationData',
                  ),
                  color: Colors.grey),
              Text(
                '$temprature° C',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$city',
                    style: TextStyle(fontSize: 30),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchPage()));
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

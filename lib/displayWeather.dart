import 'package:flutter/material.dart';
import 'package:newWeatherApp/services/weather.dart';

import 'enterCity.dart';

class WeatherScreen extends StatefulWidget {
  final locationWeather, cityWeather;

  const WeatherScreen({Key key, this.locationWeather, this.cityWeather})
      : super(key: key);
  @override
  _WeatherScreenState createState() =>
      _WeatherScreenState(locationWeather, cityWeather);
}

class _WeatherScreenState extends State<WeatherScreen> {
  final locationWeather, cityWeather;
  _WeatherScreenState(this.locationWeather, this.cityWeather);
  Map<String, dynamic> map;
  List list1;
  var temp;
  var condition;
  var city;

  @override
  Widget build(BuildContext context) {
    if (locationWeather != null) {
      temp = locationWeather['list'][0]['main']['temp'];
      condition = locationWeather['list'][0]['weather'][0]['id'];
      city = locationWeather['list'][0]['name'];
    } else {
      condition = cityWeather['weather'][0]['id'];
      temp = cityWeather['main']['temp'];
      city = cityWeather['name'];
    }

    WeatherModel weather1 = WeatherModel();
    var icon = weather1.getWeatherIcon(condition);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(city),
          actions: [
            IconButton(
                icon: Icon(Icons.location_city),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => City()));
                })
          ],
        ),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Center(
                  child: Text(temp.toString() + "\u2103" + "   " + icon,
                      style: TextStyle(fontSize: 40))),
            ])));
  }
}

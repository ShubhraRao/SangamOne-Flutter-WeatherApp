import 'package:flutter/material.dart';
import 'package:newWeatherApp/services/weather.dart';

import 'displayWeather.dart';

class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Enter city"),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: cityController,
            ),
            RaisedButton(
              child: Text("Get weather"),
              onPressed: () async {
                var weatherData = await WeatherModel().getWeatherByCity(cityController.text);
                print("hello1");
                print(weatherData);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeatherScreen(cityWeather: weatherData)));
              },
            )
          ],
        ));
  }
}

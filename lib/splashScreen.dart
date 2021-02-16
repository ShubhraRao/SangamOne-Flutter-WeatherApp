import 'package:flutter/material.dart';
import 'dart:async';

import 'package:newWeatherApp/services/weather.dart';

import 'displayWeather.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    startTimer();
  }

  startTimer() async{
    var duration = Duration(seconds: 2);
    return new Timer(duration, getWeather);
  }


  getWeather() async {
    var weatherData = await WeatherModel().getWeatherByLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherScreen(locationWeather: weatherData) ));
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      )
    );
  }
}
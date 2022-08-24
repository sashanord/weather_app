import 'package:flutter/material.dart';
import 'package:weather_app/pages/Home.dart';
import 'package:weather_app/pages/Weather_page.dart';
void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => Home(),
      '/weatherPage':(context) => WeatherPage(),
    },
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
    ),
  ));




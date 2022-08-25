// Это приложение по поиску прогноза погоды по названию города,
// а также просмотра погоды на три дня вперед
// Реализована модель BLoC с помощью пакета flutter_bloc


import 'package:flutter/material.dart';
import 'package:weather_app/pages/Home.dart';
import 'package:weather_app/pages/ListWeatherPage.dart';
import 'package:weather_app/pages/Weather_page.dart';

// обозначаем страницы приложения для лёгкого перехода между ними
void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => Home(),
      '/weatherPage':(context) => WeatherPage(),
      '/weatherPage/ListWeatherPage':(context) => ListWeatherPage(),
    },

  ));




//экран для отображения погоды на три дня

import 'package:flutter/material.dart';
import 'package:weather_app/components/WeatherCard.dart';
import 'package:weather_app/models/WeatherFor3Days.dart';

class ListWeatherPage extends StatelessWidget {
  const ListWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherList = (ModalRoute.of(context)!.settings.arguments as WeatherFor3Days).weatherList;
    return Scaffold(
      appBar: AppBar(title: Text('Погода на ближайшие три дня'), centerTitle: true,),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WeatherCard(weather: weatherList[0]),
          SizedBox(height: 10),
            WeatherCard(weather: weatherList[1]),
          SizedBox(height: 10),
            WeatherCard(weather: weatherList[2]),
          ],
        ),
      ),
    );
  }
}

// виджет для отображения погоды с основными данными, городом и датой

import 'package:flutter/material.dart';
import 'package:weather_app/models/Weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
         child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(weather.cityName),
            Text(weather.date, style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text(
              '${weather.temperature}°',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Скорость ветра: ${weather.windSpeed} м/c'),
            Text('Влажность ${weather.humidity}%')
          ],
         ),
    );
  }
}


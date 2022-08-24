import 'package:flutter/material.dart';
import 'package:weather_app/models/Weather.dart';

class WeatherCard extends StatelessWidget {

  final Weather weather;


  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Padding(
      // Добавляем отступы
      padding: EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Выравниваем по центру
          children: [
            Text(weather.cityName),
            Text(
              '${weather.temperature}°',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Скорость ветра: ${weather.windSpeed} м/c'),
            Text('Влажность ${weather.humidity}%')
          ],
        ),
      ),
    ),);
  }
}


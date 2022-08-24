import 'dart:developer' as developer;

class Weather {
  final String cityName;
  final String temperature;
  final String windSpeed;
  final String humidity;

  Weather(
      {required this.cityName,
        required this.temperature,
        required this.windSpeed,
        required this.humidity
      });

  factory Weather.fromJson(Map<String, dynamic> json) {
    Map<String,dynamic> main = json['main'];
    Map<String,dynamic> wind = json['wind'];

    return Weather(
        cityName: json['name'].toString(),
        temperature: main['temp'].toString(),
        windSpeed: wind['speed'].toString(),
        humidity: main['humidity'].toString()
    );
  }
}
//сервис, отвечающий за обработку запроса о погоде

import 'package:weather_app/models/WeatherFor3Days.dart';
import '../models/Weather.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class WeatherService {
  static String _apiKey = "1905d58ed407b3aceec48c75fdf6ee48";

  static Future<Weather> fetchCurrentWeather( //получение текущей погоды
      {query, String lat = "", String lon = ""}) async {
    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    try {
      final response = await http.post(Uri.parse(url));
      return Weather.fromJson(jsonDecode(response.body));
    } catch (_) { // в случае ошибки выбрасывается исключение
      throw Exception('Failed to load weather');
    }

  }
//получение погоды на три дня
  static Future<WeatherFor3Days> fetchWeatherFor3Days({query, String lat = "", String lon = ""}) async{
    try {
      var url =
          'http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&metric&appid=$_apiKey&units=metric';
      final response = await http.post(Uri.parse(url));
      return WeatherFor3Days.fromJson(jsonDecode(response.body)['list'], query);
    } catch(_) {
      throw Exception('Failed to load weather for 3 days');
    }
  }
}
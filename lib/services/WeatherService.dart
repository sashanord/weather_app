import '../models/Weather.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class WeatherService {
  static String _apiKey = "1905d58ed407b3aceec48c75fdf6ee48";

  static Future<Weather> fetchCurrentWeather(
      {query, String lat = "", String lon = ""}) async {
    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    try {
      final response = await http.post(Uri.parse(url));

      return Weather.fromJson(jsonDecode(response.body));
    } catch (_) {
      developer.log("Failed to load weather");
      throw Exception('Failed to load weather');
    }

  }
}
import 'dart:convert';

import '../models/City.dart';
import 'package:http/http.dart' as http;

class CityService {
  static String _apiKey = "7e7fa725f490e34c3ca6b2266f36a99d";

  static Future<City> fetchCity(query) async {
    final url =
        'http://api.openweathermap.org/geo/1.0/direct?q=$query&appid=$_apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> json = jsonDecode(response.body)[0];
      return City.fromJson(json);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load city');
    }
  }
}
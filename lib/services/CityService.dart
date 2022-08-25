//сервис, отвечающий за обработку запроса о городе

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
      //если запрос был успешен, возвращаем новый экземпляр класса город
      Map<String, dynamic> json = jsonDecode(response.body)[0];
      return City.fromJson(json);
    } else {
      //если произошла ошибка, бросается исключение
      //которе затем будет обработано в WeatherBloc
      throw Exception('Failed to load city');
    }
  }
}
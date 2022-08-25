//Класс для хранения списка погоды на три дня

import 'Weather.dart';

class WeatherFor3Days {
  late final List<Weather> weatherList;

  WeatherFor3Days({required this.weatherList});
//получение информации из json-ответа
// берётся информация через каждые 24 часа после начальной точки
// затем список сортируется, чтобы холодные дни оказались наверху
  factory WeatherFor3Days.fromJson(List<dynamic> list, String name){
    List<Weather> weatherList = [];
    weatherList.add(Weather.fromJson(list[8],name: name));
    weatherList.add(Weather.fromJson(list[17],name: name));
    weatherList.add(Weather.fromJson(list[26],name: name));
    weatherList.sort();
    return WeatherFor3Days(weatherList: weatherList);
  }
}
//Описаны состояние, которые могут возникнуть при
//обработке запроса погоды - инициализация, процесс получения данных
//успех или ошибка запроса

import '../models/Weather.dart';
import '../models/WeatherFor3Days.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

//при успешном запросе состояние будет содержать информацию о погоде
class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  final WeatherFor3Days weatherFor3Days;
  WeatherLoadSuccess({required this.weather, required this.weatherFor3Days}) : assert(weather != null);

}

class WeatherLoadFailure extends WeatherState {}
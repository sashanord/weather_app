//класс, содержащий основную бизнес-логику

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/WeatherFor3Days.dart';
import 'package:weather_app/services/CityService.dart';
import '../events/WeatherEvent.dart';
import '../models/Weather.dart';
import '../services/WeatherService.dart';
import '../states/weather_state.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherBloc() : super(WeatherInitial())
  {
    on<WeatherRequested>((event, emit) async { // обработка события Запрос погоды
      await makeEventToState(event);
    });
  }

  Future<void> makeEventToState(WeatherEvent event) async {
    if (event is WeatherRequested) {
      emit(WeatherLoadInProgress()); // посылаем состояние прогресс
      try {
        final city = await CityService.fetchCity(event.city); // обработка запроса - получение данных о городе
        final Weather weather =                               //затем о погоде
        await WeatherService.fetchCurrentWeather(query: city.name, lat: city.lat, lon: city.lon);
        final WeatherFor3Days weatherList =
        await WeatherService.fetchWeatherFor3Days(query: city.name, lat: city.lat, lon: city.lon);
        emit(WeatherLoadSuccess(weather: weather, weatherFor3Days: weatherList));
      } catch (_) { // в случае возникновения любой ошибки при запросах посылается состояние неуспеха
        emit(WeatherLoadFailure());
      }
    }
  }

}

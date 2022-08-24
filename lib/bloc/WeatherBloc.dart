import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/City.dart';
import 'package:weather_app/services/CityService.dart';
import '../events/WeatherEvent.dart';
import '../models/Weather.dart';
import '../services/WeatherService.dart';
import '../states/weather_state.dart';
import 'dart:developer' as developer;


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // String city;
  WeatherBloc() : super(WeatherInitial())
  {
    on<WeatherRequested>((event, emit) async {
      await makeEventToState(event);
    });
  }

  Future<void> makeEventToState(WeatherEvent event) async {
    if (event is WeatherRequested) {
      emit(WeatherLoadInProgress()); 
      try {
        final city = await CityService.fetchCity(event.city);
        final Weather weather =
        await WeatherService.fetchCurrentWeather(query: city.name, lat: city.lat, lon: city.lon);
        emit(WeatherLoadSuccess(weather: weather));
      } catch (_) {
        emit(WeatherLoadFailure());
      }
    }
  }

}

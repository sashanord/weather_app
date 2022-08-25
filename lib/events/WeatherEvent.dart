//Единственное возможное событие - запрос поиска погоды с названием города
abstract class WeatherEvent {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  final String city;

  const WeatherRequested(this.city) : assert(city != null);

}
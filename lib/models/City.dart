// Модель город для получения ширины и долготы города после
// запроса api
class City {
  final String name;
  final String lat;
  final String lon;

  City({required this.name, required this.lat, required this.lon});
//получение информации из ответа api json-формата
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        name: json['name'].toString(),
        lat: json['lat'].toString(),
        lon: json['lon'].toString());
  }
}

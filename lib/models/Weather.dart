//класс погода для отображения основных погодных условий,
//полученных от api - температура, скорость ветра, влажность, а также
//название города и дата

class Weather implements Comparable<Weather> {
  final String cityName;
  final String temperature;
  final String windSpeed;
  final String humidity;
  String date;

  Weather(
      {required this.cityName,
        required this.temperature,
        required this.windSpeed,
        required this.humidity,
        this.date = "today",
      }  );
// Создание нового объекта Погода из json-ответа api.
// В зависимости от запроса(погода на один день или несколько)
// преобразуюся поля названия города и даты
  factory Weather.fromJson(Map<String, dynamic> json, {String name = ""}) {
    Map<String,dynamic> main = json['main'];
    Map<String,dynamic> wind = json['wind'];
    String date = json['dt_txt']?.toString() ?? 'today';
    if(date != 'today') date = '${DateTime.parse(date).day}';
    String cityName = json['name']?.toString() ?? name;
    return Weather(
        cityName: cityName,
        temperature: main['temp'].toString(),
        windSpeed: wind['speed'].toString(),
        humidity: main['humidity'].toString(),
        date: date
    );
  }
//Метод переопределён для дальнейшей сортировки списка
//чтобы самая холодная температура была выше по списку
  @override
  int compareTo(Weather other) {
    double itsTemp = double.parse(temperature);
    double otherTemp = double.parse(other.temperature);
    if(itsTemp < otherTemp) {
      return -1;
    } else return 1;
  }
}
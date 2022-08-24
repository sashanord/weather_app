import 'dart:convert';

class City {
  final String name;
  final String lat;
  final String lon;

  City({required this.name, required this.lat, required this.lon});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        name: json['name'].toString(),
        lat: json['lat'].toString(),
        lon: json['lon'].toString());
  }
}

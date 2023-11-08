import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';

class WeatherData {
  Future<Weather> getWeatherData(var lat, var lon) async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=99f25e835f7143bb82d13520230611&q=$lat,$lon&aqi=yes');
    var response = await http.get(url);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'Models.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'https://api.openweathermap.org';
    String apiKey = '979e237b0f5e09e3c71616ac4781af58';
    Uri url = Uri.parse(
        '$baseUrl/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromjson(data);
    return weather;
  }
}


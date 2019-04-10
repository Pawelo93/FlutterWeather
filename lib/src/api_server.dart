import 'dart:convert';

import 'package:flutter_weather/src/weather_response.dart';
import 'package:http/http.dart';

abstract class ApiServer {
  Future<ForecastResponse> fetchWeather();
}

class WeatherApiServer extends ApiServer {
  Client client;

  WeatherApiServer(this.client);

  @override
  Future<ForecastResponse> fetchWeather() async {
    final url = "http://api.openweathermap.org/data/2.5/weather?units=metric&APPID=bf8d9173f157a9da6e06959b20044c9d&lat=34.052235&lon=-118.243683";
    final weatherResponse = await client.get(url);
    if(weatherResponse.statusCode != 200)
      throw Exception("Error getting weather");
    
    return ForecastResponse.fromJson(jsonDecode(weatherResponse.body));
  }
}
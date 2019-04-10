import 'package:flutter_weather/src/api_server.dart';
import 'package:flutter_weather/src/model/weather.dart';
import 'package:meta/meta.dart';

class WeatherRepository {
  final WeatherApiServer weatherApiServer;

  WeatherRepository(this.weatherApiServer)
      : assert(weatherApiServer != null);

  Future<Weather> fetchWeather() async {
    final response = await weatherApiServer.fetchWeather();
    int temperature = response.main.temp.toInt();
    int pressure = response.main.pressure;
    int humidity = response.main.humidity;
    double windSpeed = response.wind.speed;
    String description = response.weather[0].description;
    String iconUrl = response.weather[0].icon;

    return Weather(
        temperature, pressure, humidity, windSpeed, description, iconUrl);
  }
}

class ForecastResponse {
  int id;
  String name;
  WindResponse wind;
  List<WeatherResponse> weather;
  MainWeatherResponse main;

  ForecastResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        wind = WindResponse.fromJson(json['wind']),
        weather = (json['weather'] as List).map((model) =>
            WeatherResponse.fromJson(model)).toList(),
        main = MainWeatherResponse.fromJson(json['main']);
}

class WindResponse {
  double speed;

  WindResponse.fromJson(Map<String, dynamic> json) : speed = json['speed'];
}

class MainWeatherResponse {
  double temp;
  int pressure;
  int humidity;

  MainWeatherResponse.fromJson(Map<String, dynamic> json)
      : temp = json['temp'],
        pressure = json['pressure'],
        humidity = json['humidity'];
}

class WeatherResponse {
  String main;
  String description;
  String icon;

  WeatherResponse.fromJson(Map<String, dynamic> json)
      : main = json['main'],
        description = json['description'],
        icon = json['icon'];
}

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class Weather {
  int temperature;
  int pressure;
  int humidity;
  double windSpeed;
  String description;
  String iconUrl;

  Weather(
    this.temperature,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.description,
    this.iconUrl,
  );
}

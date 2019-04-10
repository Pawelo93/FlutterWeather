import 'package:flutter_weather/src/api_server.dart';
import 'package:flutter_weather/src/model/weather.dart';
import 'package:flutter_weather/src/weather_event.dart';
import 'package:flutter_weather/src/weather_repository.dart';
import 'package:flutter_weather/src/weather_response.dart';
import 'package:flutter_weather/src/weather_state.dart';
import 'package:bloc/bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherState currentState, WeatherEvent event) async* {
    if(event is FetchWeather)
      yield WeatherLoading();
    try {
      final Weather weather = await weatherRepository.fetchWeather();
      yield WeatherLoaded(weather: weather);
    }catch(_) {
      yield WeatherError();
    }
  }
}

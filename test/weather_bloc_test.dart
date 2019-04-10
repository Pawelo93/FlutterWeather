import 'package:flutter_weather/src/api_server.dart';
import 'package:flutter_weather/src/weather_bloc.dart';
import 'package:test_api/test_api.dart';
import 'package:mockito/mockito.dart';

void main() {
  test("bloc test", () async {
//    final json = "test";
//    final apiServer = MockApiServer();
//    when(apiServer.fetchWeather()).thenAnswer((_) => Future.value(json));
//    final weatherBloc = WeatherBloc(apiServer);
//
//    String a = await weatherBloc.fetchWeather();
//
//    expect(a, json);
  });
}

class MockApiServer extends Mock implements ApiServer {}
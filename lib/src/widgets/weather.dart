import 'package:flutter/material.dart';
import 'package:flutter_weather/src/combined_weather_temperature.dart';
import 'package:flutter_weather/src/last_update_time.dart';
import 'package:flutter_weather/src/location.dart';
import 'package:flutter_weather/src/weather_bloc.dart';
import 'package:flutter_weather/src/weather_event.dart';
import 'package:flutter_weather/src/weather_repository.dart';
import 'package:flutter_weather/src/weather_state.dart';
import 'package:flutter_weather/src/widgets/city_selection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class Weather extends StatefulWidget {
  final WeatherRepository weatherRepository;

  Weather(this.weatherRepository);

  @override
  Widget build(BuildContext context) {
    return Container(
//      child: Center(
//        child: FutureBuilder(
//          future: weatherBloc.fetchWeather(),
//          builder: (context, AsyncSnapshot<Weather> snapshot) {
//            if (snapshot.connectionState == ConnectionState.done) {
//                return Text(snapshot.data.temperature.toString());
//            } else
//              return Text("");
//          },
//        ),
//      ),
        );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WeatherState();
  }
}

class _WeatherState extends State<Weather> {
  WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc(widget.weatherRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
                _weatherBloc.dispatch(FetchWeather(city: city));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (_, WeatherState state) {
            if (state is WeatherEmpty) {
              return Center(child: Text('Please Select a Location'));
            }
            if (state is WeatherLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoaded) {
              final weather = state.weather;

              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Location("some location"),
                    ),
                  ),
                  Center(
                    child: LastUpdateTime(DateTime.now()), // todo change this
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: CombinedWeatherTemperature(weather),
                    ),
                  ),
                ],
              );
            }
            if (state is WeatherError) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _weatherBloc.dispose();
    super.dispose();
  }
}

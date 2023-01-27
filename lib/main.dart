import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/blocs.dart';
import 'package:weather_app/models/models.dart';
import 'package:weather_app/screens/search_page.dart';

//void main() => runApp(MyWeatherApp());

void main() {
  // BlocOverrides.runZoned(() {
  //   MyWeatherApp();
  // }, blocObserver: SimpleBlocObserver());

  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<WeatherRepository>(
      create: (_) => WeatherRepository(weatherApiClient: WeatherApiClient()),
      child: BlocProvider(
          create: (context) => WeatherBloc(context.read<WeatherRepository>())
            ..add(ResetWeather()),
          child: MaterialApp(title: 'Weather App', home: SearchPage())),
    );
  }
}

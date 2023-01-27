import 'package:equatable/equatable.dart';
import 'package:weather_app/models/WeatherModel.dart';

// ! These are the states

abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]);
}

class WeatherIsNotSearched extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WeatherIsLoading extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WeatherIsLoaded extends WeatherState {
  final WeatherResponse? weather;
  WeatherIsLoaded({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherError extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

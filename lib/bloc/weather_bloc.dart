import 'package:weather_app/bloc/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/models/WeatherModel.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  // WeatherBloc(WeatherState WeatherIsNotSearched, this.weatherRepository) : super(WeatherIsNotSearched);
  WeatherBloc(this.weatherRepository) : super(WeatherIsLoading()) {
    on<FetchWeather>(_onFetchWeather);
    on<ResetWeather>(_onResetWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherIsLoading());

    try {
      final WeatherResponse? weather =
          await weatherRepository.getWeather(event.city);
      emit(WeatherIsLoaded(weather: weather));
    } catch (_) {
      emit(WeatherError());
      print(_);
    }
  }

  void _onResetWeather(ResetWeather event, Emitter<WeatherState> emit) {
    emit(WeatherIsNotSearched());
  }
}

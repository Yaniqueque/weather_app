// import 'package:http/http.dart' as http;
// import 'package:weather_app/bloc/WeatherModel.dart';

// import 'dart:convert';

// class WeatherApiClient {
//   Future<WeatherResponse> getWeather(String city) async {
//     const String apiKey = "af59b0facc783692186a8704fcd82e6d";
//     final String url = "https://api.openweathermap.org/data/2.5/weather?q={$city}&appid={$apiKey}";

//     final result = await http.get(Uri.parse(url));

//     final mainResponse = WeatherResponse.fromJson(json.decode(result.body));

//     return mainResponse;
//   }

// }

import 'package:http/http.dart' as http;
import 'package:weather_app/models/WeatherModel.dart';

class WeatherApiClient {
  final _baseUrl = 'https://api.openweathermap.org/data/2.5';
  final _apiKey = "af59b0facc783692186a8704fcd82e6d";

  Future<WeatherResponse?> fetchWeather(String city) async {
    //var url = Uri.https(_baseUrl, "/weather", {'q': city, 'appid': _apiKey});
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric");
    //final String url = "https://api.openweathermap.org/data/2.5/weather?q={$city}&appid={$apiKey}";

    final result = await http.get(url);

    final response = weatherResponseFromJson(result.body);
    //final response = WeatherResponse.fromJson(result.body);
    return response;
  }

  // Future<WeatherResponse> getWeather(WeatherResponse weather) {
  //   var url= Uri.https(_baseUrl, "/weather", {
  //     'q': city,
  //     'appid':_apiKey
  //   });
  //   //final String url = "https://api.openweathermap.org/data/2.5/weather?q={$city}&appid={$apiKey}";

  //   final result = await http.get(url);
  //   final response = weatherResponseFromJson(result.body);
  //   return

  // }

}

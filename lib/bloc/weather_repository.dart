import 'package:weather_app/models/WeatherModel.dart';

import 'package:weather_app/models/models.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({required this.weatherApiClient});

  Future<WeatherResponse?> getWeather(String city) async {
    final WeatherResponse? weather = await weatherApiClient.fetchWeather(city);
    return weather;
  }
}



// class WeatherRepository {
//   Future<WeatherResponse> getWeather(String city) async {
//     const String apiKey = "af59b0facc783692186a8704fcd82e6d";
//     final String url = "https://api.openweathermap.org/data/2.5/weather?q={$city}&appid={$apiKey}";

//     final result = await http.get(Uri.parse(url));

//     final mainResponse = weatherResponseFromJson(result.body);

  // if(result.statusCode != 200){
  //     throw Exception();
  // }

  //return parsedJson(result.body);
  // }

  // Main parsedJson(final response) {
  //    final jsonDecoded = json.decode(response);
  //}

  // void _errorDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (_) =>
  //     AlertDialog(
  //       title: Text("No cargo el clima"),
  //       content: Text("No se pudo cargar la informacion"),
  //       actions: [
  //         TextButton(onPressed: (){},
  //         child: Text("Okay"))
  //       ]
  //       ,
  //     )
  //     )
  // }

// }

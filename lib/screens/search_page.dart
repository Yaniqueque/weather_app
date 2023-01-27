import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/blocs.dart';
import 'package:weather_app/screens/show_weather.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ! Se inicializa el provider del bloc
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final cityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.search,
        size: 30,
        color: Colors.white70,
        ),
        
        actions: [

        ],
      ),
      backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Center(
              child: SizedBox(
            child: FlareActor(
              "assets/WorldSpin.flr",
              fit: BoxFit.contain,
              animation: "roll",
            ),
            height: 300,
            width: 300,
          )),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherIsNotSearched) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Search Weather",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            prefix: Icon(
                              Icons.search,
                              color: Colors.white70,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white70,
                                    style: BorderStyle.solid)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.red,
                                    style: BorderStyle.solid)),
                            hintText: "City Name",
                            hintStyle: const TextStyle(color: Colors.white70),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          child: const Text(
                            "Search",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          onPressed: () {
                            weatherBloc
                                .add(FetchWeather(city: cityController.text));
                          },
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is WeatherIsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is WeatherIsLoaded) {
                return ShowWeather(
                  weather: state.weather,
                  city: cityController.text,
                );
              } else {
                return const Text(
                  "Error",
                  style: const TextStyle(color: Colors.white),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

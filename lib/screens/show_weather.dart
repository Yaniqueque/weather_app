import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/blocs.dart';
import 'package:weather_app/models/WeatherModel.dart';
import 'package:weather_app/widgets/widgets.dart';

class ShowWeather extends StatelessWidget {
  final WeatherResponse? weather;
  final String? city;

  const ShowWeather({
    Key? key,
    required this.weather,
    required this.city,

    // this.city
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Container(
        padding: const EdgeInsets.only(right: 32, left: 32, top: 10),
        child: Column(children: [
          ShowTempeture(
            color: Colors.white70,
            fontsize: 30,
            text: weather!.name.toString(),
            fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                const SizedBox(
                  height: 10,
                ),
                ShowTempeture(
                  color: Colors.white70,
                  fontsize: 30,
                  text: weather!.main!.temp!.round().toString() + "°" + "C",
                ),
                const ShowTempeture(
                  color: Colors.white70,
                  fontsize: 14,
                  text: "Temperature",
                ),
                Column(
                  children: [
                    ShowTempeture(
                      text: weather!.coord!.lat.toString(),
                      color: Colors.white70,
                      fontsize: 30,
                    ),
                    const ShowTempeture(
                      color: Colors.white70,
                      fontsize: 14,
                      text: "Latitud",
                    ),
                  ],
                ),
              ]),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          ShowTempeture(
                            color: Colors.white70,
                            fontsize: 30,
                            text: weather!.main!.tempMin!.round().toString() +
                                "°" +
                                "C",
                          ),
                          const ShowTempeture(
                            color: Colors.white70,
                            fontsize: 14,
                            text: "Min. Temperature",
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ShowTempeture(
                            color: Colors.white70,
                            fontsize: 30,
                            text: weather!.main!.tempMax!.round().toString() +
                                "°" +
                                "C",
                          ),
                          const ShowTempeture(
                            color: Colors.white70,
                            fontsize: 14,
                            text: "Max. Temperature",
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              // Column(
              //   children: [
              //     Row(
              //       children: [
              //         Image.network(
              //             "http://openweathermap.org/img/wn/${weather!.weather![0].icon}@2x.png")
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () {
                weatherBloc.add(ResetWeather());
              },
              color: Colors.lightBlue,
              child: const Text(
                "Search",
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
          ),
        ]));
  }
}

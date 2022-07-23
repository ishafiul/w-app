
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wapp/presentation/weather/weather_screen.dart';
import 'package:wapp/state/weather/weather_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      WeatherBloc()..add(WeatherRequest(cityName: "Dhaka")),
      child: MaterialApp(
        home: WeatherApp(),
      ),
    );
  }
}

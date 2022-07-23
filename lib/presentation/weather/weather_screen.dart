import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wapp/common/button.dart';
import 'package:wapp/utils/utils.dart';

import '../../state/weather/weather_bloc.dart';

class WeatherApp extends StatelessWidget {
  final _cityController = TextEditingController();

   WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoadInprogress) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Loading"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is WeatherLoadInprogress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoadFailure) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (state is WeatherLoadSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      hintText: "Enter city name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        state.weather.name,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        state.weather.main["temp"].toString(),
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  Button(buttontext: 'Get Weather', onPressed: () {
                    if (_cityController.text.isNotEmpty) {
                      context.read<WeatherBloc>().add(
                        WeatherRequest(
                          cityName: _cityController.text,
                        ),
                      );
                    }
                  }, buttonDecoration: jButtonDecoration,),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

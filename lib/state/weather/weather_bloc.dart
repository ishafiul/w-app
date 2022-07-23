import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:wapp/data/models/weather.dart';
import 'package:wapp/data/repositorys/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepository = WeatherRepository();
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequest) {
      yield WeatherLoadInprogress();

      try {
        final weatherResponse = await _weatherRepository.getWeather(event.cityName);
        yield WeatherLoadSuccess(weather: weatherResponse);
      } catch (e) {
        yield WeatherLoadFailure(error: e.toString());
      }
    }
  }
}

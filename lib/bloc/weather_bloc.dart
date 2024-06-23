
import 'package:climate_app/data/my_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(FetechLoading());
      try {

        WeatherFactory wf = WeatherFactory(API_KEY,language: Language.ENGLISH);
        Position position =await Geolocator.getCurrentPosition();
Weather weather = await  wf.currentWeatherByLocation(event.position.latitude, event.position.longitude);
        emit(FetechSuccess(weather));
        print(weather);
      }catch(e){
emit(FetechFailure());
      }
    });
  }
}

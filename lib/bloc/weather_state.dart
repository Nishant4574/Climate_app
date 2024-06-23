part of 'weather_bloc.dart';

@immutable
sealed class WeatherState extends Equatable{
  const WeatherState();
  @override
  // TODO: implement hashCode
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}
final class FetechLoading extends WeatherState{}
final class FetechFailure extends WeatherState{}
final class FetechSuccess extends WeatherState{
  final Weather weather;
  const FetechSuccess(this.weather);
  @override
  // TODO: implement hashCode
  List<Object> get props => [weather];

}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models.dart';
import '../Service.dart';
import 'WeatherState.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}

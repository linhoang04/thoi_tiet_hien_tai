import 'package:get/get.dart';
import 'package:project1/model/city_model.dart';
import 'package:project1/model/weather_model.dart';
import 'package:project1/repositories/weather_repo.dart';

class WeatherController extends GetxController with StateMixin<CurrentWeather> {
  final CityModel city;
  WeatherController({required this.city}) {
    fetchWeather2();
  }
  WeatherRepo weathers = WeatherRepo();
  void fetchWeather2() async {
    final weatherDataList =
        await weathers.fetchWeather(city.latitude, city.longitude);
    final CurrentWeather weather = CurrentWeather.fromJson(weatherDataList);
    print(weatherDataList);
    change(weather, status: RxStatus.success());
  }
}

import 'package:dio/dio.dart';

class WeatherRepo {
  Future<Map<String, dynamic>> fetchWeather(
      double latitude, double longitude) async {
    Dio dio = Dio();
    final response = await dio.get(
      "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true",
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> dataBody = response.data;
      print(dataBody);
      final listCurrent = dataBody['current_weather'] as Map<String, dynamic>;
      // final CurrentWeather weatherData = CurrentWeather.fromJson(listCurrent);
      print(listCurrent);
      return listCurrent;
    } else {
      throw 'Error';
    }
  }
}

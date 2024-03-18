import 'package:dio/dio.dart';
import 'package:project1/model/city_model.dart';

class CityRepo {
  Future<City> fetchCity(String location) async {
    Dio dio = Dio();
    final response = await dio.get(
        "https://geocoding-api.open-meteo.com/v1/search?name=$location&count=20");
    if (response.statusCode == 200) {
      final Map<String, dynamic> dataBody = response.data;

      // final List<dynamic> cityData = dataBody['results'] ?? [];

      // List<CityModel> cities =
      //     cityData.map((json) => CityModel.fromJson(json)).toList();
      return City.fromJson(dataBody);
    } else {
      throw 'Error';
    }
  }
}

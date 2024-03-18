import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/model/city_model.dart';

import '../repositories/city2_repo.dart';

class CityController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final listCitys = <CityModel>[].obs;
  List<CityModel> get citys => listCitys.toList();
  final CityRepo _cityRepo = CityRepo();
  Future<void> fetchCity(String location) async {
    try {
      final cityData = await _cityRepo.fetchCity(location);
      listCitys.value = cityData.results;
      print(listCitys);
    } catch (e) {
      print("$e");
    }
  }
}

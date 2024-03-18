import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/weather_controller.dart';
import 'package:project1/model/city_model.dart';

class WeatherScreen extends GetView<WeatherController> {
  const WeatherScreen({super.key, required this.model});
  final CityModel model;
  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController =
        Get.put(WeatherController(city: model));
    // final CityController controller = Get.put(CityController());
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Du Bao Thoi Tiet'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: weatherController.obx((state) {
                    if (state != null) {
                      return ListTile(
                        title: Text(
                            'Temperature: ${state.temperature}°C\nNumerval: ${state.numerval}\nTime: ${state.time}\nWindspeed: ${state.windspeed}\nWinddirection: ${state.winddirection}\nIsDay: ${state.isDay}\nWeathercode: ${state.weathercode}'),
                      );
                    } else {
                      return const Center(child: Text('No value'));
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

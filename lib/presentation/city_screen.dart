import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/presentation/weather_screen.dart';

import '../controller/city_controller2.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final CityController cityController = Get.put(CityController());
    return Column(
      children: [
        TextField(
          controller: cityController.textEditingController,
          decoration: const InputDecoration(hintText: 'hanoi'),
          onChanged: (location) {
            cityController.fetchCity(location);
          },
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: GetX<CityController>(
            init: CityController(),
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.listCitys.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.listCitys[index].name.toString()),
                    onTap: () {
                      Get.to(() => (WeatherScreen(
                            model: controller.listCitys[index],
                          )));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) =>
                      //       WeatherScreen(model: controller.listCitys[index]),
                      // ));
                    },
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

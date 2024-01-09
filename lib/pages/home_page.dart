import 'package:angoragh_e_commerce/constant.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName='/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      SizedBox(height: 100,),
      Obx(() {
        if (HomeController.to.sliderList.value.isEmpty) {
          return CircularProgressIndicator();
        } else {
          return Row(

            children: HomeController.to.sliderList.value.map((slider) {
              return Image.network(
                '${contstant.apiUrl}${slider.bigImage}',
                height: 200,
                fit: BoxFit.cover,
              );
            }).toList(),
          );
        }
      })
    ],),);
  }
}

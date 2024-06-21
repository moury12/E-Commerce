import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class CampingDetailsScreen extends StatelessWidget {
  static const String routeName= '/camping-details';
  const CampingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final camp =HomeController.to.campingDetailsModel.value;
    return Scaffold(
      appBar: AppBar(title: Text(camp.name??''),),
      body: Column(children: [
      Image.network('${Constant.url}${camp.image}',fit: BoxFit.fitWidth,),
    ],),);
  }
}

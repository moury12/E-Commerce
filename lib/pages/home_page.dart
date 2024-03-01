import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName='/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [

Image.network('${contstant.url}${HomeController.to.campingBanner.value.image}'),

SizedBox( height: 200,
  child: ListView.builder(itemCount: HomeController.to.bannerList.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
    final banner =HomeController.to.bannerList[index];
    return Image.network('${contstant.url}${banner.image}');
    },),
),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(HomeController.to.categoryList.length, (index) {
                final category =HomeController.to.categoryList[index];
                return Column(
                  children: [
                    Image.network('${contstant.url}${category.image}',height:
                    50,),
                    Text(category.name??'')
                  ],
                );
              })
            ],
          ),
        )
    ],),);
  }
}

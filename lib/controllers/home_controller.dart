import 'dart:convert';

import 'package:angoragh_e_commerce/constant.dart';
import 'package:angoragh_e_commerce/models/slider_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {


  static HomeController get to => HomeController();
  @override
  void onInit() {
    FetchSliderData();
    super.onInit();
  }
  RxList<SliderModel> sliderList = <SliderModel>[].obs;
  Future<void> FetchSliderData() async {
    final response = await http.get(Uri.parse('${contstant.apiUrl}getSlider'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
       /*final List<dynamic> dataList =jsonResponse['data'];
  sliderList.value.assignAll(dataList.map((e) => SliderModel.fromJson(e)).toList());*/
     /* jsonResponse['data'].forEach((slide) {
        sliderList.add(SliderModel.fromJson(slide));
        print(sliderList);
      });*/
      if (jsonResponse['status'] != null && jsonResponse['status']) {
        jsonResponse['data'].forEach((slide) {
          sliderList.add(SliderModel.fromJson(slide));
          print(sliderList);
        });
      } else if (jsonResponse['status'] != null && !jsonResponse['status']) {
        print(jsonResponse['message']);
      }
    } else {
      print(response.statusCode);
    }
  }
}

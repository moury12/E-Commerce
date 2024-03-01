import 'dart:convert';

import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/models/slider_model.dart';
import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:mh_core/utils/global.dart';

class HomeService {
  static Future<List<BannerModel>> bannerCall() async {
    List<BannerModel> bannerList = [];
    final url = Uri.parse('${contstant.apiUrl}banner_image');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.get(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    globalLogger.d(responseData);
if(responseData['success']){
  final List<dynamic> bannerDataList = responseData['data'];
  bannerList=bannerDataList.map((e) => BannerModel.fromJson(e)).toList();
}else{
  showSnackBar(msg: responseData['message']);
}
    return bannerList;
  }
  static Future<CampaignModel> bannerCampCall() async {

    final url = Uri.parse('${contstant.apiUrl}forCampBanner');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.get(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    globalLogger.d(responseData);
if(responseData['success']){
  final  Map<String, dynamic> campingData = responseData['data'];
  return CampaignModel.fromJson(campingData);
}else{
 return showSnackBar(msg: responseData['message']);
}

  }
  static Future<List<CategoryModel>> categoryCall() async {
    List<CategoryModel> categoryList = [];
    final url = Uri.parse('${contstant.apiUrl}category');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.get(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    globalLogger.d(responseData);
    if(responseData['success']){
      final List<dynamic> bannerDataList = responseData['data'];
      categoryList=bannerDataList.map((e) => CategoryModel.fromJson(e))
          .toList();
    }else{
      showSnackBar(msg: responseData['message']);
    }
    return categoryList;
  }
}

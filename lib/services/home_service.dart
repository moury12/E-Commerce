import 'dart:convert';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/models/camping_details_model.dart';
import 'package:angoragh_e_commerce/models/camping_type_model.dart';
import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/models/checkout_model.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:angoragh_e_commerce/models/slider_model.dart';
import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeService {
  static Future<List<BannerModel>> bannerCall() async {
    List<BannerModel> bannerList = [];
    final url = Uri.parse('${Constant.apiUrl}banner_image');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (responseData['success']) {
      final List<dynamic> bannerDataList = responseData['data'];
      bannerList = bannerDataList.map((e) => BannerModel.fromJson(e)).toList();
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return bannerList;
  }

  static Future<List<CampingType>> campingTypeCall() async {
    List<CampingType> campingTypeList = [];
    final url = Uri.parse('${Constant.apiUrl}campaign_type');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (responseData['success']) {
      final List<dynamic> campingType = responseData['data'];
      campingTypeList = campingType.map((e) => CampingType.fromJson(e)).toList();
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return campingTypeList;
  }

  static Future<CampaignModel> bannerCampCall() async {
    CampaignModel campingData = CampaignModel();
    final url = Uri.parse('${Constant.apiUrl}forCampBanner');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (responseData['success'] != null && responseData['success']) {
      campingData = CampaignModel.fromJson(responseData['data']);
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return campingData;
  }
  static Future<List<DeliveryChargeModel>> deliverChargeCall() async {
    List<DeliveryChargeModel> charge = [];
    final url = Uri.parse('${Constant.apiUrl}delivery_charges');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> dataList =responseData['data'];
    if (responseData['success'] != null && responseData['success']) {
      charge = dataList.map((e) =>DeliveryChargeModel.fromJson(e) ,).toList();
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return charge;
  }

  static Future<List<CategoryModel>> categoryCall() async {
    List<CategoryModel> categoryList = [];
    final url = Uri.parse('${Constant.apiUrl}category');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (responseData['success'] != null && responseData['success']) {
      final List<dynamic> bannerDataList = responseData['data'];
      categoryList = bannerDataList.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return categoryList;
  }

  static Future<List<ProductModel>> sellerPickCall({String? paginationUrl}) async {
    List<ProductModel> productList = [];
    bool hasMoreData = true;
    if (hasMoreData) {
      final url = Uri.parse(paginationUrl ?? '${Constant.apiUrl}sellers_picks_data');
      final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
      final response = await http.get(url, headers: headers);

      final Map<String, dynamic> responseData = jsonDecode(response.body);
      debugPrint(responseData.toString());
      if (responseData['success'] != null && responseData['success']) {
        final Map<String, dynamic> data = responseData['data'];
        final List<dynamic> productDataList = data['data']; // Accessing the 'data' field correctly
        productList = productDataList.map((e) => ProductModel.fromJson(e)).toList();
        HomeController.to.paginationUrl.value = data['next_page_url'];
        paginationUrl = HomeController.to.paginationUrl.value;
      } else {
        Get.snackbar('Error', responseData['message']);
        hasMoreData = false;
      }
    }
    return productList;
  }

  static Future<CampingDetailsModel> fetchCampingDetails(String id) async {
    CampingDetailsModel campingDetails = CampingDetailsModel();
    final url = Uri.parse('${Constant.apiUrl}campaign/$id');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    debugPrint(responseData.toString());
    if (responseData['success'] != null && responseData['success']) {
      campingDetails = CampingDetailsModel.fromJson(responseData['data']);
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return campingDetails;
  }
}

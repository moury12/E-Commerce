import 'dart:convert';

import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/models/product_details_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductService{
  static Future<ProductDetailsModel> fetchProductDetails(String slug) async{
    ProductDetailsModel productDetailsModel=ProductDetailsModel();
    final url =Uri.parse('${contstant.apiUrl}get_single_products/$slug');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
final response = await http.get(headers: headers,url);
final Map<String, dynamic> responseData =jsonDecode(response.body);
    if(responseData['success']!=null && responseData['success']){
      productDetailsModel = ProductDetailsModel.fromJson(responseData['data']);
    }
    else{
      Get.snackbar('Error', responseData['message']);
    }
    return productDetailsModel;
  }
}
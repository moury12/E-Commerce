import 'dart:convert';

import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/models/color_size_brand_model.dart';
import 'package:angoragh_e_commerce/models/product_details_model.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:angoragh_e_commerce/utils/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<ProductDetailsModel> fetchProductDetails(String slug) async {
    ProductDetailsModel productDetailsModel = ProductDetailsModel();
    final url = Uri.parse('${contstant.apiUrl}get_single_products/$slug');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response = await http.get(headers: headers, url);
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (responseData['success'] != null && responseData['success']) {
      productDetailsModel = ProductDetailsModel.fromJson(responseData['data']);
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return productDetailsModel;
  }

  static Future<List<MultilevelCategoryModel>> fetchMultilevelCategory() async {
    List<MultilevelCategoryModel> categoryList = [];
    final url = Uri.parse('${contstant.apiUrl}category_level');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> dataList = responseData['menuData'];
    if (responseData['success'] != null && responseData['success']) {
      categoryList = dataList.map((v) => MultilevelCategoryModel.fromJson(v)).toList();
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return categoryList;
  }
  static Future<List<FilteredProductModel>> fetchProductByFilter({String? paginationUrl}) async {
    List<FilteredProductModel> filteredProducts = [];
    final url = Uri.parse(paginationUrl ??
        '${contstant.apiUrl}product-filter?pagination=10&subcategory='
            '${ProductController.to.subCategory.isEmpty ? '[]' : '${ProductController.to.subCategory}'}'
            '&child_category=${ProductController.to.childCategory.isEmpty ? '[]' : '${ProductController.to.childCategory}'}'
            '&brand=[]&color=[]&size=[]&max_min=[]'
            '&category=${ProductController.to.category.isEmpty ? '[]' : '${ProductController.to.category}'}');

    debugPrint(url.toString());
    debugPrint(ProductController.to.category.toString());
    final headers = {'Accept': 'application/json'};
    final response = await http.get(url, headers: headers);
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> dataList = responseData['data']['data'];
    debugPrint(responseData.toString());

    debugPrint(dataList.toString());
    if (responseData['success'] != null && responseData['success']) {
      filteredProducts = dataList.map((e) => FilteredProductModel.fromJson(e)).toList();
      if (responseData['data']['next_page_url'] != null) {
        ProductController.to.paginationUrl.value = responseData['data']['next_page_url'];
        paginationUrl = ProductController.to.paginationUrl.value;
      } else {
        ProductController.to.paginationUrl.value = '';
        paginationUrl = '';
      }
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return filteredProducts;
  }

  static Future<Map<ProductVariation, List<ColorSizeModel>>> fetchColorSizeOfProduct() async {
    List<ColorSizeModel> colors = [];
    List<ColorSizeModel> sizes = [];
    final url1 = Uri.parse('${contstant.apiUrl}product/color');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response1 = await http.get(url1, headers: headers);
    final Map<String, dynamic> colorsData = jsonDecode(response1.body);
    final List<dynamic> colorList = colorsData['data']['colors'];
    if (colorsData['success'] != null && colorsData['success']) {
      colors = colorList.map((e) => ColorSizeModel.fromJson(e)).toList();
    } else {
      Get.snackbar('error', colorsData['message']);
    }
    final url2 = Uri.parse('${contstant.apiUrl}product/size');
    final response2 = await http.get(url2, headers: headers);
    final Map<String, dynamic> sizeData = jsonDecode(response2.body);
    final List<dynamic> sizeList = sizeData['data']['sizes'];
    if (sizeData['success'] != null && sizeData['success']) {
      sizes = sizeList.map((e) => ColorSizeModel.fromJson(e)).toList();
    } else {
      Get.snackbar('error', sizeData['message']);
    }
    return{
      ProductVariation.color:colors,
      ProductVariation.size: sizes
    };
  }
  static Future<List<BrandModel>> fetchBrandOfProduct() async{
    List<BrandModel> brandList =[];
    final url =Uri.parse('${contstant.apiUrl}product/brand');
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    final response = await http.get(url,headers: headers);
    final Map<String, dynamic> responseData =jsonDecode(response.body);
    final List<dynamic> dataList = responseData['data']['brand'];
    if(responseData['success']!=null && responseData['success']){
      brandList= dataList.map((e) => BrandModel.fromJson(e)).toList();
    }else{
      Get.snackbar('Error', responseData['message']);
    }
    return brandList;
  }
}

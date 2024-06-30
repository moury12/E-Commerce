import 'dart:convert';
import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:angoragh_e_commerce/models/my_order_details_model.dart';
import 'package:angoragh_e_commerce/models/my_order_list_model.dart';
import 'package:angoragh_e_commerce/models/order_data_model.dart';
import 'package:angoragh_e_commerce/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserService {
  static Future<UserModel> fetchUserData(String token) async {
    UserModel user = UserModel();
    final url = Uri.parse('${Constant.apiUrl}user');
    final header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(url, headers: header);
    Map<String, dynamic> responseData = jsonDecode(response.body);
    debugPrint(responseData.toString());
    if (response.statusCode == 200) {
      user = UserModel.fromJson(responseData);
    } else {
      Get.snackbar('Authenticate Error', 'Failed to load user data');
    }
    return user;
  }

  static Future<OrderDataModel> orderProduct(dynamic body, String token) async {
    OrderDataModel orderData = OrderDataModel();
    final url = Uri.parse('${Constant.apiUrl}order_data');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.post(url, body: jsonEncode(body), headers: headers);
    final Map<String, dynamic> responseData = await jsonDecode(response.body);
    debugPrint(body.toString());
    debugPrint(responseData.toString());
    if (responseData['success'] != null && responseData['success']) {
      orderData = OrderDataModel.fromJson(responseData['data']);
      Get.snackbar("Thanks", "Order place Successfully");
    } else {
      Get.snackbar("We are sorry!", responseData['message']);
    }
    return orderData;
  }

  static Future<List<MyOrderListModel>> fetchMyOrderList() async {
    List<MyOrderListModel> orderList = [];
    final url = Uri.parse('${Constant.apiUrl}my_order_list');
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.to.token}',
    };
    final response = await http.get(url, headers: header);
    final responseData = jsonDecode(response.body);
    debugPrint('$responseData -----------------order data');
    final List<dynamic> order = responseData['data'];
    if (responseData['success'] != null && responseData['success']) {
      orderList = order.map((e) => MyOrderListModel.fromJson(e)).toList();
    } else {
      Get.snackbar('Error', responseData['message']);
    }
    return orderList;
  }
  static Future<MyOrderDetailsModel> fetchMyOderDetails(String id) async{
MyOrderDetailsModel orderDetails =MyOrderDetailsModel();
final url = Uri.parse('${Constant.apiUrl}track_order_details/$id');
final header = {
  'Accept': 'application/json',
  'Content-Type': 'application/json',
  'Authorization': 'Bearer ${AuthController.to.token}',
};
final response = await http.get(url,headers: header);
final Map<String, dynamic> responseData = jsonDecode(response.body);
debugPrint(responseData.toString());
if(responseData['success']!=null&&responseData['success']){
  orderDetails = MyOrderDetailsModel.fromJson(responseData['data']);
}
return orderDetails;
  }
}

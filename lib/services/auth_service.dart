import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:angoragh_e_commerce/constant/constant.dart';

import '../models/user_model.dart';

class AuthService{
static Future<Map<String ,dynamic>> loginService(String email, String password) async{
  final url=Uri.parse('${Constant.apiUrl}login');
  final headers ={ 
    'Accept':'application/json',
    'Content-Type':'application/json'
  };
  final body =jsonEncode({'email':email,'password':password});
  final response = await http.post(url,headers: headers,body: body);
  final Map<String ,dynamic> responseData =json.decode(response.body);

  return responseData;

}
static Future<UserModel> fetchUserData(String token) async{
  UserModel user =UserModel();
  final url = Uri.parse('${Constant.apiUrl}user');
  final header ={
    'Accept':'application/json',
    'Authorization': 'Bearer $token',
  };
  final response =  await http.get(url,headers: header);
  Map<String, dynamic> responseData =jsonDecode(response.body);
  debugPrint(responseData.toString());
  if(response.statusCode ==200){
    user= UserModel.fromJson(responseData);
  }else{
    Get.snackbar('Authenticate Error','Failed to load user data');
  }
  return user;
}
}
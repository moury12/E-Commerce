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
}
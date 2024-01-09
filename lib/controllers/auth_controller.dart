import 'dart:convert';

import 'package:angoragh_e_commerce/constant.dart';
import 'package:angoragh_e_commerce/models/auth_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mh_core/utils/global.dart';
class AuthController extends GetxController{
  static AuthController get to => AuthController();
  Future<bool> isLoggedIn() async {
    return GetStorage().read('token') != null;
  }
  String? get authToken => GetStorage().read('token');


 static Future<AuthTokenModel> loginUser({required String email, required String password}) async{
final response =await http.post(Uri.parse('${contstant.apiUrl}login'),
body: jsonEncode({'email':email,'password':password}),
headers: {
  'Content-Type':'application/json'
}
);
if(response.statusCode==200){
  final Map<String,dynamic> jsonResponse =json.decode(response.body);
  final String token =jsonResponse['data']['token'];
  GetStorage().write('token', token);
  globalLogger.d(token,'Auth_token');
  return AuthTokenModel(token: token);
}
else{
  throw Exception('Failed to login');
}
 }
}
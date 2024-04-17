import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:mh_core/utils/global.dart';

class AuthService{
static Future<Map<String ,dynamic>> loginService(String email, String password)
async{
  final url=Uri.parse('${contstant.apiUrl}login');
  final headers ={ 
    'Accept':'application/json',
    'Content-Type':'application/json'
  };
  final body =jsonEncode({'email':email,'password':password});
  final response = await http.post(url,headers: headers,body: body);
  final Map<String ,dynamic> responseData =json.decode(response.body);
  globalLogger.d(responseData, 'login response');
  return responseData;
 /* if(response.statusCode==200){
final Map<String ,dynamic> responseData =json.decode(response.body);
globalLogger.d(responseData, 'login response');
return responseData;
  }
  else{
   return {};
  }*/
}
}
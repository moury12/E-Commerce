import 'package:angoragh_e_commerce/models/slider_model.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/utils/string_utils.dart';

class HomeService{
  static Future<List<SliderModel>> getSliderList() async{
    List<SliderModel> sliderList= [];
    final response= await ServiceAPI.genericCall(url: '${ServiceAPI.apiUrl}getSlider', httpMethod: HttpMethod.get);
    globalLogger.d(response,'slider list');
    if(response['status'] !=null && response['status']){
      response['data'].forEach((cat){
        sliderList.add(SliderModel.fromJson(cat));
      });
    }else{
      ServiceAPI.showAlert(errorMessageJson(response['message']));
    }
    return sliderList;
  }
}
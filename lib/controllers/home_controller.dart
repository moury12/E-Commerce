import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/services/home_service.dart';
import 'package:angoragh_e_commerce/models/slider_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  RxList<BannerModel> bannerList = <BannerModel>[].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  Rx<CampaignModel> campingBanner = CampaignModel().obs;
  @override
  void onInit() {
    fetchBanner();
    fetchCampingBanner();
    fetchCategory();
    super.onInit();
  }

  void fetchBanner() async {
    bannerList.value = await HomeService.bannerCall();
  }
  void fetchCategory() async {
    categoryList.value = await HomeService.categoryCall();
  }

  void fetchCampingBanner() async {
    campingBanner.value = await HomeService.bannerCampCall();
  }
}

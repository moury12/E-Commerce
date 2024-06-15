import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:angoragh_e_commerce/services/home_service.dart';
import 'package:angoragh_e_commerce/models/slider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  RxList<BannerModel> bannerList = <BannerModel>[].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<ProductModel> sellerPickList = <ProductModel>[].obs;
  Rx<CampaignModel> campingBanner = CampaignModel().obs;
  RxBool isLoading = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMoreData = true.obs;
  final int perPage =5;
  ScrollController scrollController =ScrollController();
  @override
  void onInit() {
    fetchBanner();
    fetchCampingBanner();
    fetchCategory();
    fetchSellerPick();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isLoading.value && hasMoreData.value) {
        fetchSellerPick();
      }
    }
    );
    super.onInit();
  }
@override
  void onClose() {
    scrollController.dispose();
    // TODO: implement onClose
    super.onClose();
  }
  void fetchBanner() async {
    bannerList.value = await HomeService.bannerCall();
  }
  void fetchCategory() async {
    categoryList.value = await HomeService.categoryCall();
  }
  void fetchSellerPick() async {
    if(isLoading.value||!hasMoreData.value){
      return;
    }else{
      isLoading.value=true;
      try{
        sellerPickList.value = await HomeService.sellerPickCall(currentPage.value, perPage);
if(sellerPickList.isNotEmpty){
  currentPage.value++;
}else{
  hasMoreData.value=false;
}
      }catch(e){
        Get.snackbar('Error', e.toString());
      }finally{
        isLoading.value=false;
      }
    }

  }

  void fetchCampingBanner() async {
    campingBanner.value = await HomeService.bannerCampCall();
  }
}

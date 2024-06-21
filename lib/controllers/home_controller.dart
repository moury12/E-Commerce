import 'package:angoragh_e_commerce/models/camping_details_model.dart';
import 'package:angoragh_e_commerce/models/camping_type_model.dart';
import 'package:angoragh_e_commerce/models/camping_type_model.dart';
import 'package:angoragh_e_commerce/models/category_model.dart';
import 'package:angoragh_e_commerce/models/color_size_brand_model.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:angoragh_e_commerce/services/home_service.dart';
import 'package:angoragh_e_commerce/models/slider_model.dart';
import 'package:angoragh_e_commerce/services/product_service.dart';
import 'package:angoragh_e_commerce/utils/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  RxList<BannerModel> bannerList = <BannerModel>[].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<ProductModel> sellerPickList = <ProductModel>[].obs;
  RxList<ColorSizeModel> colorList = <ColorSizeModel>[].obs;
  RxList<ColorSizeModel> sizeList = <ColorSizeModel>[].obs;
  RxList<BrandModel> brandList = <BrandModel>[].obs;
  RxList<CampingType> campingTypeList = <CampingType>[].obs;
  RxString paginationUrl = ''.obs;
  RxList<MultilevelCategoryModel> multilevelCategory = <MultilevelCategoryModel>[].obs;
  Rx<CampaignModel> campingBanner = CampaignModel().obs;
  Rx<CampingDetailsModel> campingDetailsModel = CampingDetailsModel().obs;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    fetchBanner();
    fetchCampingBanner();
    fetchCategory();
    fetchSellerPick();
    fetchMultilevelCategory();
    getSizeColorData();
    fetchBrand();
    fetchCampingType();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (paginationUrl.value.isNotEmpty) {
          fetchSellerPick(initialCall: false);
        }
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    // TODO: implement onClose
    super.onClose();
  }

  void fetchCampingType() async {
    campingTypeList.value = await HomeService.campingTypeCall();
  }
void fetchCampingDetails(String id ) async{
    campingDetailsModel.value =await HomeService.fetchCampingDetails(id);
}
  void fetchBrand() async {
    brandList.value = await ProductService.fetchBrandOfProduct();
  }

  void fetchBanner() async {
    bannerList.value = await HomeService.bannerCall();
  }

  void fetchCategory() async {
    categoryList.value = await HomeService.categoryCall();
  }

  Future<void> getSizeColorData() async {
    final data = await ProductService.fetchColorSizeOfProduct();
    colorList.value = data[ProductVariation.color] as List<ColorSizeModel>;
    sizeList.value = data[ProductVariation.size] as List<ColorSizeModel>;
  }

  void fetchSellerPick({bool initialCall = true}) async {
    final productData = await HomeService.sellerPickCall(paginationUrl: initialCall ? null : paginationUrl.value);
    if (initialCall) {
      sellerPickList.value = productData;
    } else {
      sellerPickList.addAll(productData);
    }
  }

  void fetchMultilevelCategory() async {
    multilevelCategory.value = await ProductService.fetchMultilevelCategory();
  }

  void fetchCampingBanner() async {
    campingBanner.value = await HomeService.bannerCampCall();
  }
}

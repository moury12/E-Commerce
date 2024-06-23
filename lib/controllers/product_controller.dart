import 'package:angoragh_e_commerce/DB/db_helper.dart';
import 'package:angoragh_e_commerce/models/cart_model.dart';
import 'package:angoragh_e_commerce/models/product_details_model.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:angoragh_e_commerce/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  Rx<ProductDetailsModel> productDetails = ProductDetailsModel().obs;
  RxList<FilteredProductModel> productList = <FilteredProductModel>[].obs;
  RxList<int> category = <int>[].obs;
  RxList<int> subCategory = <int>[].obs;
  RxList<int> childCategory = <int>[].obs;
  RxList<int> colorList = <int>[].obs;
  RxList<int> sizeList = <int>[].obs;
  RxList<int> brandList = <int>[].obs;
  RxList<CartModel> cartList=<CartModel>[].obs;
  RxString paginationUrl = ''.obs;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  void fetchProductDetails(String slug) async {
    productDetails.value = await ProductService.fetchProductDetails(slug);
  }
  void fetchCartList() async{
    cartList.value = await DatabaseHelper.getCartData();
    debugPrint(cartList.toString());
  }

  Future<void> fetchFilteredProducts({bool initialCall = true}) async {
    final newProducts = await ProductService.fetchProductByFilter(paginationUrl: initialCall ? null : paginationUrl.value);

    if (initialCall) {
      productList.value = newProducts;
    } else {
      productList.addAll(newProducts);
    }
  }

  void _scrollListener() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (paginationUrl.value.isNotEmpty) {
        await fetchFilteredProducts(initialCall: false);
      }
    }
  }
}

import 'package:angoragh_e_commerce/DB/db_helper.dart';
import 'package:angoragh_e_commerce/models/cart_model.dart';
import 'package:angoragh_e_commerce/models/order_calculation_model.dart';
import 'package:angoragh_e_commerce/models/order_calculation_model.dart';
import 'package:angoragh_e_commerce/models/product_details_model.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:angoragh_e_commerce/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  Rx<ProductDetailsModel> productDetails = ProductDetailsModel().obs;
  Rx<OrderCalculationModel> orderCalculation = OrderCalculationModel().obs;
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
  TextEditingController couponController = TextEditingController();
  @override
  void onInit() {
    fetchCartList();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
@override
  void onClose() {
couponController.dispose();    super.onClose();
  }
  void fetchProductDetails(String slug) async {
    productDetails.value = await ProductService.fetchProductDetails(slug);
  }
  void getProductCalculation(dynamic body) async{
    orderCalculation.value =await ProductService.orderCalculation(body);
  }
  void fetchCartList() async{
    cartList.value = await DatabaseHelper.getCartData();
    // debugPrint(cartList.toString());
  }
void updateCartQuantity(int id, String quantity) async{
    await DatabaseHelper.updateCart(id, quantity);
    cartList.refresh();
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

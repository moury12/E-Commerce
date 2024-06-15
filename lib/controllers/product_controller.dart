import 'package:angoragh_e_commerce/models/product_details_model.dart';
import 'package:angoragh_e_commerce/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get to => Get.find();

  Rx<ProductDetailsModel> productDetails = ProductDetailsModel().obs;

void fetchProductDetails(String slug) async{
  productDetails.value = await ProductService.fetchProductDetails(slug);
}
}
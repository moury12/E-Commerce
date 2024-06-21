import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName ='/product-details';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
             () {
              return Text(ProductController.to.productDetails.value.products!.name??'');
            }
          )
        ],
      ),
    );
  }
}

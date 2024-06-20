import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:angoragh_e_commerce/pages/product-details/productDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductModel>? productModel;
  final List<FilteredProductModel>? filterProduct;
  const ProductListWidget({super.key,  this.productModel, this.filterProduct});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Obx(
  () {
        return GridView.builder(
          controller:productModel!=null?HomeController.to.scrollController: ProductController.to.scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: ( productModel == null)?filterProduct!.length:productModel!.length,
          itemBuilder: (context, index) {
          final product=(productModel == null)?filterProduct![index]:productModel![index];
          if (product is ProductModel) {
            return buildProductItem(product);
          } else if (product is FilteredProductModel) {
            return buildFilteredProductItem(product);
          } else {
            return Container();
          }

        },);
      }
    ),);
  }

  Widget buildFilteredProductItem(FilteredProductModel product) {
    return
      Column(
        children: [
          Image.network('${contstant.url}${product.mainImages}',height: 100,width: 100,),
          Text(product.name??''),Text(product.categoryId??'')
        ],
      );
  }
}

Widget buildProductItem(ProductModel product) {
  return GestureDetector(
    onTap: () {
      if (product.slug != null || product.slug!.isNotEmpty) {
        Get.put(ProductController());
        ProductController.to.fetchProductDetails(product.slug ?? '');
        Get.toNamed(ProductDetailsScreen.routeName);
      } else {
        Get.snackbar('Sorry!', "Product details is not available.");
      }
    },
    child: Column(
      children: [
        Expanded(
          child: Image.network(fit: BoxFit.fitWidth, '${contstant.url}${product.mainImages ?? ''}'),
        ),
        Text(product.name ?? ''),
      ],
    ),
  );
}

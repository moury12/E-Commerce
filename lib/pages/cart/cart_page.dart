import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [ElevatedButton(onPressed: () {
        ProductController.to.getProductCalculation({

        });
        ProductController.to.cartList.refresh();

       debugPrint( ProductController.to.cartList.map((element) {
         element.id??'';
       },).toString());
      }, child: Text('Calculate'))],),
      body: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) {
            final cart = ProductController.to.cartList[index];

            // Find the matching product in sellerPickList
            final product = HomeController.to.sellerPickList.firstWhere(
              (element) => element.slug == cart.productSlug,
              orElse: () => ProductModel(),
            );

            return ListTile(
              title: Text(product.name ?? 'No name'),
              subtitle: Text(
                'Quantity: ${cart.quantity}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                     final newVal=   int.parse(cart.quantity)+1;
                     ProductController.to.updateCartQuantity(cart.id??0, newVal.toString());
                     ProductController.to.fetchCartList();
                      }, icon: const Icon(CupertinoIcons.plus_circle)),
                  IconButton(
                      onPressed: () {
                        if(int.parse(cart.quantity) >1){
                          final newVal=   int.parse(cart.quantity)-1;
                          ProductController.to.updateCartQuantity(cart.id??0, newVal.toString());
                          ProductController.to.fetchCartList();
                        }
                      }, icon: const Icon(CupertinoIcons.minus_circle))
                ],
              ),
            );
          },
          itemCount: ProductController.to.cartList.length,
        );
      }),
    );
  }
}

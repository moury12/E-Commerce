import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:angoragh_e_commerce/controllers/user_controller.dart';
import 'package:angoragh_e_commerce/models/product_model.dart';
import 'package:angoragh_e_commerce/pages/auth/login_page.dart';
import 'package:angoragh_e_commerce/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () async {
                if (AuthController.to.token != null) {
                  ProductController.to.cartList
                          .where(
                            (e) => e.selected ?? false,
                          )
                          .isEmpty
                      ? Get.snackbar("Error", "Please select from cart List")
                      : UserController.to.getOrderData();
                } else {
                  Get.toNamed(LoginScreen.routeName);
                }
              },
              child: const Text('order')),
          ElevatedButton(
              onPressed: () {
// debugPrint( ProductController.to.cartList.where((e) => e.selected??false,).map((element) {
//   return {'"product_id"':element.productId,'"quantity"':element.quantity,'"campaign_id"':element.campaignId};
// },).toList().toString());
                ProductController.to.getProductCalculation({
                  'order_details': ProductController.to.cartList
                      .where(
                        (e) => e.selected ?? false,
                      )
                      .map(
                        (element) {
                          return {'"product_id"': element.productId, '"quantity"': element.quantity, '"campaign_id"': element.campaignId};
                        },
                      )
                      .toList()
                      .toString(),
                  'coupon_code': ProductController.to.couponController.text
                });
              },
              child: const Text('Calculate'))
        ],
      ),
      body: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                // primary: false,
                itemBuilder: (context, index) {
                  final cart = ProductController.to.cartList[index];

                  // Find the matching product in sellerPickList
                  final product = HomeController.to.sellerPickList.firstWhere(
                    (element) => element.slug == cart.productSlug,
                    orElse: () => ProductModel(),
                  );

                  return ListTile(
                    onTap: () {
                      cart.selected = !cart.selected!;
                      ProductController.to.cartList.refresh();
                    },
                    tileColor: cart.selected! ? Colors.black26 : Colors.transparent,
                    title: Text(product.name ?? 'No name'),
                    leading: IconButton(
                      icon: const Icon(CupertinoIcons.delete),
                      onPressed: () {
                        ProductController.to.deleteCartItem(cart.id ?? 0);
                      },
                    ),
                    subtitle: Text(
                      'Quantity: ${cart.quantity}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              final newVal = int.parse(cart.quantity) + 1;
                              ProductController.to.updateCartQuantity(cart.id ?? 0, newVal.toString());
                              ProductController.to.fetchCartList();
                            },
                            icon: const Icon(CupertinoIcons.plus_circle)),
                        IconButton(
                            onPressed: () {
                              if (int.parse(cart.quantity) > 1) {
                                final newVal = int.parse(cart.quantity) - 1;
                                ProductController.to.updateCartQuantity(cart.id ?? 0, newVal.toString());
                                ProductController.to.fetchCartList();
                              }
                            },
                            icon: const Icon(CupertinoIcons.minus_circle))
                      ],
                    ),
                  );
                },
                itemCount: ProductController.to.cartList.length,
              ),
            );
          }),
          Obx(() => Text(UserController.to.orderData.value.id??'')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: ProductController.to.couponController,
              decoration: const InputDecoration(hintText: 'enter coupon code'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Obx(() {
                  return Text("grand total: ${ProductController.to.cartList.where(
                        (e) => e.selected ?? false,
                      ).toList().isEmpty ? "" : ProductController.to.orderCalculation.value.order!.grandTotal ?? ''}");
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

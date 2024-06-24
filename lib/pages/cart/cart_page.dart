import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName ='/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
        final cart = ProductController.to.cartList[index];
        return ListTile()
      }, itemCount: ProductController.to.cartList.length,
      ),
    );
  }
}

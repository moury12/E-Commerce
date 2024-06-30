import 'package:angoragh_e_commerce/controllers/user_controller.dart';
import 'package:angoragh_e_commerce/pages/order/order_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOrderListScreen extends StatelessWidget {
  static const String routeName ='/user-orders';
  const UserOrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: UserController.to.userOrderList.length,
        itemBuilder: (context, index) {
        final orders= UserController.to.userOrderList[index];
        return ListTile(
          onTap: () {
            UserController.to.getOrderDetails(orders.id??'');
            Get.toNamed(OrderDetails.routeName);
          },
          title: Text(orders.subtotal??''),);
      },),
    );
  }
}

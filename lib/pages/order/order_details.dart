import 'package:angoragh_e_commerce/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  static const String routeName ='/order-details';
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var order = UserController.to.orderDetailsData.value;
    return Scaffold(
      body: Center(child: Text(order.subtotal??''),),
    );
  }
}

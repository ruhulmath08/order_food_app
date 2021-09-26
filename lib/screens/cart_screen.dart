import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order_food_app/state/cart_state.dart';

class CartDetailsScreen extends StatelessWidget {
  final box = GetStorage();
  final CartStateController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          controller.getQuantity() > 0
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear),
                )
              : Container(),
        ],
      ),
      body: controller.getQuantity() > 0 ? Container() : Center(child: Text('Cart Details')),
    );
  }
}

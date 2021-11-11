import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_food_app/state/cart_state.dart';
import 'package:order_food_app/state/main_state.dart';
import 'package:order_food_app/strings/cart_string.dart';
import 'package:order_food_app/utils/utils.dart';
import 'package:order_food_app/widgets/cart/cart_total_item_widget.dart';

class TotalWidget extends StatelessWidget {
  TotalWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CartStateController controller;
  final MainStateController mainStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TotalItemWidget(
              text: totalText,
              value: currencyFormat.format(
                controller.sumCart(mainStateController.selectedRestaurant.value.restaurantId),
              ),
              isSubTotal: false,
            ),
            Divider(thickness: 1, color: Colors.grey),
            TotalItemWidget(
              text: shippingFeeText,
              value: currencyFormat.format(
                controller.getShippingFee(mainStateController.selectedRestaurant.value.restaurantId),
              ),
              isSubTotal: false,
            ),
            Divider(thickness: 1, color: Colors.grey),
            TotalItemWidget(
              text: subTotalText,
              value: currencyFormat.format(
                controller.getSubTotal(mainStateController.selectedRestaurant.value.restaurantId),
              ),
              isSubTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}

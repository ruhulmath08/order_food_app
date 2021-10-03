import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order_food_app/state/cart_state.dart';
import 'package:order_food_app/strings/cart_string.dart';
import 'package:order_food_app/view_model/cart_vm/cart_view_model_imp.dart';
import 'package:order_food_app/widgets/cart/cart_image_widget.dart';
import 'package:order_food_app/widgets/cart/cart_info_widget.dart';
import 'package:order_food_app/widgets/cart/cart_total_widget.dart';

class CartDetailsScreen extends StatelessWidget {
  final box = GetStorage();
  final CartStateController controller = Get.find();
  final CartViewModelImp cartViewModel = new CartViewModelImp();

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
      body: controller.getQuantity() > 0
          ? Obx(
              () => Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cart.length,
                      itemBuilder: (context, index) => Slidable(
                        actionPane: SlidableBehindActionPane(),
                        actionExtentRatio: 0.25,
                        secondaryActions: [
                          IconSlideAction(
                            caption: deleteText,
                            icon: Icons.delete,
                            color: Colors.red,
                            onTap: () {},
                          ),
                        ],
                        child: Card(
                          elevation: 8.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 6.0,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CartImageWidget(
                                    cartModel: controller.cart[index],
                                    controller: controller,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: CartInfo(cartModel: controller.cart[index]),
                                ),
                                Center(
                                  child: ElegantNumberButton(
                                    textStyle: TextStyle(color: Colors.white, fontSize: 25),
                                    color: Colors.amber,
                                    initialValue: controller.cart[index].quantity,
                                    minValue: 1,
                                    maxValue: 100,
                                    onChanged: (value) {
                                      cartViewModel.updateCart(controller, index, value.toInt());
                                    },
                                    decimalPlaces: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TotalWidget(controller: controller)
                ],
              ),
            )
          : Center(child: Text('Cart Details')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order_food_app/state/cart_state.dart';
import 'package:order_food_app/strings/cart_string.dart';
import 'package:order_food_app/widgets/cart/cart_image_widget.dart';

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
      body: controller.getQuantity() > 0
          ? Obx(
              () => Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
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
                                    controller: controller,
                                    cartModel: controller.cart[index],
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(child: Text('Cart Details')),
    );
  }
}

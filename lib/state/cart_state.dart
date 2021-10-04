import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order_food_app/model/cart_model.dart';
import 'package:order_food_app/model/food_model.dart';
import 'package:order_food_app/strings/cart_string.dart';
import 'package:order_food_app/utils/const.dart';

class CartStateController extends GetxController {
  var cart = List<CartModel>.empty(growable: true).obs;
  final box = GetStorage();

  addToCart(FoodModel foodModel, {int quantity: 1}) async {
    try {
      var cartItem = CartModel(
        id: foodModel.id,
        image: foodModel.image,
        price: foodModel.price,
        name: foodModel.name,
        addon: foodModel.addon,
        size: foodModel.size,
        description: foodModel.description,
        quantity: quantity,
      );
      if (isExist(cartItem)) {
        //if cart item is already available in cart
        var foodNeedToUpdate = cart.firstWhere((element) => element.id == cartItem.id);
        foodNeedToUpdate.quantity += quantity;
      } else {
        cart.add(cartItem);
      }
      //after update info, we will save it to storage
      var jsonDBEncode = jsonEncode(cart);
      await box.write(MY_CART_KEY, jsonDBEncode);
      cart.refresh(); //update cart
      Get.snackbar(successTitle, successMessage);
    } catch (e) {
      Get.snackbar(errorTitle, e.toString());
    }
  }

  isExist(CartModel cartItem) => cart.any((e) => e.id == cartItem.id);

  sumCart() =>
      cart.length == 0 ? 0 : cart.map((element) => element.price * element.quantity).reduce((value, element) => value + element);

  getQuantity() => cart.length == 0 ? 0 : cart.map((element) => element.quantity).reduce((value, element) => value + element);

  getShippingFee() => sumCart() * 0.1; //10% of total value

  getSubTotal() => sumCart() + getShippingFee();

  clearCart() {
    cart.clear();
    saveDatabase();
  }

  saveDatabase() => box.write(MY_CART_KEY, jsonEncode(cart));
}

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

  getCart(String restaurantId) => cart.where((item) => item.restaurantId == restaurantId);
  addToCart(FoodModel foodModel, String restaurantId, {int quantity: 1}) async {
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
        restaurantId: restaurantId,
      );
      if (isExist(cartItem, restaurantId)) {
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

  isExist(CartModel cartItem, String restaurantId) => cart.any((e) => e.id == cartItem.id && e.restaurantId == restaurantId);

  sumCart(String restaurantId) => getCart(restaurantId).length == 0
      ? 0
      : getCart(restaurantId).map((element) => element.price * element.quantity).reduce((value, element) => value + element);

  getQuantity(String restaurantId) =>
      getCart(restaurantId).length == 0 ? 0 : getCart(restaurantId).map((element) => element.quantity).reduce((value, element) => value + element);

  getShippingFee(String restaurantId) => sumCart(restaurantId) * 0.1; //10% of total value

  getSubTotal(String restaurantId) => sumCart(restaurantId) + getShippingFee(restaurantId);

  clearCart(String restaurantId) {
    getCart(restaurantId).clear();
    saveDatabase();
  }

  saveDatabase() => box.write(MY_CART_KEY, jsonEncode(cart));
}

import 'package:order_food_app/state/cart_state.dart';
import 'package:order_food_app/view_model/cart_vm/cart_view_model.dart';

class CartViewModelImp extends CartViewModel {
  void updateCart(CartStateController controller, int index, int value) {
    controller.cart[index].quantity = value.toInt();
    controller.cart.refresh();
    controller.saveDatabase();
  }

  void deleteCart(CartStateController controller, int index) {
    controller.cart.removeAt(index);
    controller.saveDatabase();
  }

  void clearCart(CartStateController controller) {
    controller.clearCart();
  }
}

import 'package:order_food_app/state/cart_state.dart';

abstract class CartViewModel {
  void updateCart(CartStateController controller, int index, int value);
}

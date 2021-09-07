import 'package:order_food_app/firebase/restaurant_reference.dart';
import 'package:order_food_app/model/restaurant_model.dart';
import 'package:order_food_app/view_model/main_vm/main_view_model.dart';

class MainViewModelImp extends MainViewModel {
  @override
  Future<List<RestaurantModel>> displayRestaurantList() {
    return getRestaurantList();
  }
}

import 'package:order_food_app/model/restaurant_model.dart';

abstract class MainViewModel {
  Future<List<RestaurantModel>> displayRestaurantList();
}

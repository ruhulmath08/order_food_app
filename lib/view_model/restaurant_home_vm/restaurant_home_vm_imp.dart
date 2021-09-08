import 'package:order_food_app/firebase/popular_reference.dart';
import 'package:order_food_app/model/popular_item_model.dart';
import 'package:order_food_app/view_model/restaurant_home_vm/restaurant_home_vm.dart';

class RestaurantHomeViewModelImp implements RestaurantHomeViewModel {
  @override
  Future<List<PopularItemModel>> displayMostPopularByRestaurantId(String restaurantId) {
    return getMostPopularByRestaurantId(restaurantId);
  }

  @override
  Future<List<PopularItemModel>> displayBestDealsByRestaurantId(String restaurantId) {
    return getMostPopularByRestaurantId(restaurantId);
  }
}

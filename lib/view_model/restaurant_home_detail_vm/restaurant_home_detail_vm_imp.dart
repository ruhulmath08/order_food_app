import 'package:order_food_app/firebase/popular_reference.dart';
import 'package:order_food_app/model/popular_item_model.dart';
import 'package:order_food_app/view_model/restaurant_home_detail_vm/restaurant_home_detail_vm.dart';

class RestaurantHomeDetaailViewModelImp implements RestaurantHomeDetailViewModel {
  @override
  Future<List<PopularItemModel>> displayMostPopularByRestaurantId(String restaurantId) {
    return getMostPopularByRestaurantId(restaurantId);
  }

  @override
  Future<List<PopularItemModel>> displayBestDealsByRestaurantId(String restaurantId) {
    return getMostPopularByRestaurantId(restaurantId);
  }
}

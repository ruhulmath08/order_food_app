import 'package:order_food_app/model/popular_item_model.dart';

abstract class RestaurantHomeDetailViewModel {
  Future<List<PopularItemModel>> displayMostPopularByRestaurantId(String restaurantId);
  Future<List<PopularItemModel>> displayBestDealsByRestaurantId(String restaurantId);
}

import 'package:order_food_app/firebase/category_reference.dart';
import 'package:order_food_app/model/category_model.dart';
import 'package:order_food_app/view_model/category_vm/category_viewmodel.dart';

class CategoryViewModelImp extends CategoryViewModel {
  @override
  Future<List<CategoryModel>> displayCategoryByRestaurantId(String restaurantId) {
    return getCategoryByRestaurantId(restaurantId);
  }
}

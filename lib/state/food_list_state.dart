import 'package:get/get.dart';
import 'package:order_food_app/model/food_model.dart';

class FoodListStateController extends GetxController {
  var selectedFood = FoodModel(
    id: 'id',
    name: 'name',
    image: 'image',
    price: 0,
    size: [],
    addon: [],
    description: 'description',
  ).obs;
}

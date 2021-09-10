import 'package:order_food_app/model/food_model.dart';

class CategoryModel {
  String key = '';
  String name = '';
  String image = '';
  List<FoodModel> foods = List<FoodModel>.empty(growable: true);
}

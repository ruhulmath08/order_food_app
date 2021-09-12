import 'package:order_food_app/model/food_model.dart';

class CategoryModel {
  String key = '';
  String name = '';
  String image = '';
  List<FoodModel> foods = List<FoodModel>.empty(growable: true);

  CategoryModel({
    required this.name,
    required this.image,
    required this.foods,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    if (json['foods'] != null) {
      foods = List<FoodModel>.empty(growable: true);
      json['foods'].forEach((v) {
        foods.add(FoodModel.formJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['foods'] = this.foods.map((v) => v.toJson()).toList();

    return data;
  }
}

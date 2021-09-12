import 'package:order_food_app/model/addon_model.dart';
import 'package:order_food_app/model/size_model.dart';

class FoodModel {
  String id = '';
  String name = '';
  String image = '';
  double price = 0;
  String description = '';
  List<SizeModel> size = List<SizeModel>.empty(growable: true);
  List<AddonModel> addon = List<AddonModel>.empty(growable: true);

  FoodModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.size,
    required this.addon,
    required this.description,
  });

  FoodModel.formJson(Map<String, dynamic> json) {
    name = json['name'];
    price = double.parse(json['price'].toString());
    id = json['id'];
    image = json['image'];
    description = json['description'];
    if (json['addon'] != null) {
      addon = List<AddonModel>.empty(growable: true);
      json['addon'].forEach((v) {
        addon.add(AddonModel.formJson(v));
      });
    }
    if (json['size'] != null) {
      size = List<SizeModel>.empty(growable: true);
      json['size'].forEach((v) {
        size.add(SizeModel.formJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['description'] = this.description;
    data['size'] = this.size.map((v) => v.toJson()).toList();
    data['addon'] = this.addon.map((v) => v.toJson()).toList();

    return data;
  }
}

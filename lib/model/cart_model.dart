import 'package:order_food_app/model/food_model.dart';

class CartModel extends FoodModel {
  int quantity = 0;

  CartModel({
    id,
    name,
    image,
    price,
    size,
    addon,
    description,
    required this.quantity,
  }) : super(
          id: id,
          name: name,
          image: image,
          price: price,
          size: size,
          addon: addon,
          description: description,
        );

  factory CartModel.formJson(Map<String, dynamic> json) {
    final food = FoodModel.formJson(json);
    final quantity = json['quantity'];
    return CartModel(
      id: food.id,
      image: food.image,
      price: food.price,
      name: food.name,
      addon: food.addon,
      size: food.size,
      description: food.description,
      quantity: quantity,
    );
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
    data['quantity'] = this.quantity;

    return data;
  }
}

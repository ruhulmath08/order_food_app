class PopularItemModel {
  String foodId = '';
  String name = '';
  String menuId = '';
  String image = '';

  PopularItemModel({
    required this.foodId,
    required this.name,
    required this.menuId,
    required this.image,
  });

  PopularItemModel.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    name = json['name'];
    menuId = json['menuId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['name'] = this.name;
    data['menuId'] = this.menuId;
    data['image'] = this.image;

    return data;
  }
}

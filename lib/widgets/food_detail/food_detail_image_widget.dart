import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:order_food_app/const/const.dart';
import 'package:order_food_app/state/food_list_state.dart';
import 'package:order_food_app/utils/utils.dart';

class FoodDetailImageWidget extends StatelessWidget {
  const FoodDetailImageWidget({
    Key? key,
    required this.foodListStateController,
  }) : super(key: key);

  final FoodListStateController foodListStateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: foodDetailImageAreaSide(context) * 0.9,
          child: Hero(
            tag: foodListStateController.selectedFood.value.name,
            child: CachedNetworkImage(
              imageUrl: foodListStateController.selectedFood.value.image,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Center(child: Icon(Icons.image));
              },
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.8, 1.0),
          heightFactor: 0.5,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: FAB_FAV_TAG,
                  onPressed: () {},
                  child: Icon(Icons.favorite_border, color: Colors.black),
                  backgroundColor: Colors.white,
                  elevation: 10,
                ),
                FloatingActionButton(
                  heroTag: FAB_CART_TAG,
                  onPressed: () {},
                  child: Icon(Icons.add_shopping_cart, color: Colors.black),
                  backgroundColor: Colors.white,
                  elevation: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

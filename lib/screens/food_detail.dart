import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/state/category_state.dart';
import 'package:order_food_app/state/food_list_state.dart';
import 'package:order_food_app/utils/utils.dart';

class FoodDetailScreen extends StatelessWidget {
  final CategoryStateController categoryStateController = Get.find();
  final FoodListStateController foodListStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(
                  '${foodListStateController.selectedFood.value.name}',
                  style: GoogleFonts.jetBrainsMono(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                elevation: 10,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                foregroundColor: Colors.black,
                bottom: PreferredSize(
                  preferredSize: Size.square(foodDetailImageAreaSide(context)),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: foodDetailImageAreaSide(context) * 0.9,
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
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container(),
        ),
      ),
    );
  }
}

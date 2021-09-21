import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/state/category_state.dart';
import 'package:order_food_app/state/food_detail_state.dart';
import 'package:order_food_app/state/food_list_state.dart';
import 'package:order_food_app/utils/utils.dart';
import 'package:order_food_app/widgets/food_detail/food_detail_description.dart';
import 'package:order_food_app/widgets/food_detail/food_detail_image_widget.dart';
import 'package:order_food_app/widgets/food_detail/food_detail_name_widget.dart';

class FoodDetailScreen extends StatelessWidget {
  final CategoryStateController categoryStateController = Get.find();
  final FoodListStateController foodListStateController = Get.find();
  final FoodDetailStateController foodDetailStateController = Get.put(FoodDetailStateController());

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
                  child: FoodDetailImageWidget(
                    foodListStateController: foodListStateController,
                  ),
                ),
              )
            ];
          },
          body: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodDetailNameWidget(
                  foodListStateController: foodListStateController,
                  foodDetailStateController: foodDetailStateController,
                ),
                FoodDetailDescriptionWidget(foodListStateController: foodListStateController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

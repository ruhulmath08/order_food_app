import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/model/size_model.dart';
import 'package:order_food_app/state/food_detail_state.dart';
import 'package:order_food_app/state/food_list_state.dart';
import 'package:order_food_app/strings/food_detail_size.dart';

class FoodDetailSizeWidget extends StatelessWidget {
  const FoodDetailSizeWidget({
    Key? key,
    required this.foodListStateController,
    required this.foodDetailStateController,
  }) : super(key: key);

  final FoodListStateController foodListStateController;
  final FoodDetailStateController foodDetailStateController;

  @override
  Widget build(BuildContext context) {
    return foodListStateController.selectedFood.value.size.length > 0
        ? Card(
            elevation: 12,
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => ExpansionTile(
                      title: Text(
                        sizeText,
                        style: GoogleFonts.jetBrainsMono(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      children: foodListStateController.selectedFood.value.size
                          .map(
                            (foodSize) => RadioListTile<SizeModel>(
                              title: Text(foodSize.name),
                              value: foodSize,
                              groupValue: foodDetailStateController.selectedSize.value,
                              onChanged: (value) {
                                foodDetailStateController.selectedSize.value = value!;
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}

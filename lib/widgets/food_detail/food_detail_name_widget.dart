import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/state/food_detail_state.dart';
import 'package:order_food_app/state/food_list_state.dart';

class FoodDetailNameWidget extends StatelessWidget {
  const FoodDetailNameWidget({
    Key? key,
    required this.foodListStateController,
    required this.foodDetailStateController,
  }) : super(key: key);

  final FoodListStateController foodListStateController;
  final FoodDetailStateController foodDetailStateController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${foodListStateController.selectedFood.value.name}',
              style: GoogleFonts.jetBrainsMono(
                color: Colors.blueGrey,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${foodListStateController.selectedFood.value.price}',
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
                Obx(
                  () => ElegantNumberButton(
                    buttonSizeHeight: 40,
                    buttonSizeWidth: 45,
                    textStyle: TextStyle(color: Colors.white, fontSize: 25),
                    color: Colors.amber,
                    initialValue: foodDetailStateController.quantity.value,
                    minValue: 1,
                    maxValue: 100,
                    onChanged: (value) {
                      foodDetailStateController.quantity.value = value.toInt();
                    },
                    decimalPlaces: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
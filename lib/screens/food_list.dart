import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/state/category_state.dart';

class FoodListScreen extends StatelessWidget {
  final CategoryStateController categoryStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${categoryStateController.selectedCategory.value.name}',
          style: GoogleFonts.jetBrainsMono(color: Colors.black),
        ),
        elevation: 10,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text('We have ${categoryStateController.selectedCategory.value.foods.length} fod'),
      ),
    );
  }
}

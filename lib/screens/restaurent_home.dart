import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/state/main_state.dart';
import 'package:order_food_app/view_model/restaurant_home_vm/restaurant_home_vm.dart';
import 'package:order_food_app/view_model/restaurant_home_vm/restaurant_home_vm_imp.dart';
import 'package:order_food_app/widgets/restaurent_home/most_popular_widget.dart';

class RestaurantHome extends StatelessWidget {
  final MainStateController mainStateController = Get.find();
  final RestaurantHomeViewModel viewModel = RestaurantHomeViewModelImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mainStateController.selectedRestaurant.value.name,
          style: GoogleFonts.jetBrainsMono(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 10,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: MostPopularWidget(viewModel: viewModel, mainStateController: mainStateController),
            ),
            Expanded(
              flex: 2,
              child: Container(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

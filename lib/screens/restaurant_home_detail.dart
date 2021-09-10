import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/state/main_state.dart';
import 'package:order_food_app/view_model/restaurant_home_detail_vm/restaurant_home_detail_vm_imp.dart';
import 'package:order_food_app/widgets/restaurent_home_detail/best_deal_widget.dart';
import 'package:order_food_app/widgets/restaurent_home_detail/most_popular_widget.dart';

class RestaurantHomeDetails extends StatelessWidget {
  final MainStateController mainStateController = Get.find();
  final RestaurantHomeDetaailViewModelImp viewModel = RestaurantHomeDetaailViewModelImp();
  final ZoomDrawerController zoomDrawerController;

  RestaurantHomeDetails(this.zoomDrawerController);

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
        iconTheme: IconThemeData(color: Colors.black),
        leading: InkWell(
          onTap: () => zoomDrawerController.toggle!(),
          child: Icon(Icons.view_headline),
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
              child: BestDealsWidget(viewModel: viewModel, mainStateController: mainStateController),
            ),
          ],
        ),
      ),
    );
  }
}

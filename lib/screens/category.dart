import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/model/category_model.dart';
import 'package:order_food_app/state/category_state.dart';
import 'package:order_food_app/state/main_state.dart';
import 'package:order_food_app/strings/restaurant_home_strings.dart';
import 'package:order_food_app/view_model/category_vm/category_viewmodel_imp.dart';
import 'package:order_food_app/widgets/category/category_list_widget.dart';

class CategoryScreen extends StatelessWidget {
  final viewModel = CategoryViewModelImp();
  //because we already put in Main screen, so here we just find
  final CategoryStateController categoryStateController = Get.put(CategoryStateController());
  //we not put it before, so we must do that
  final MainStateController mainStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryText, style: GoogleFonts.jetBrainsMono(color: Colors.black)),
        elevation: 10,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder(
        future: viewModel.displayCategoryByRestaurantId(mainStateController.selectedRestaurant.value.restaurantId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            var list = snapshot.data as List<CategoryModel>;

            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: Center(
                child: CategoryListWidget(
                  list: list,
                  categoryStateController: categoryStateController,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

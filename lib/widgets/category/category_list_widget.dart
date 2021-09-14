import 'dart:ui';

import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/const/const.dart';
import 'package:order_food_app/model/category_model.dart';
import 'package:order_food_app/screens/food_list.dart';
import 'package:order_food_app/state/category_state.dart';
import 'package:order_food_app/widgets/common/common_widgets.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
    required this.list,
    required this.categoryStateController,
  }) : super(key: key);

  final List<CategoryModel> list;
  final CategoryStateController categoryStateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LiveGrid(
            showItemInterval: Duration(milliseconds: 300),
            showItemDuration: Duration(milliseconds: 300),
            reAnimateOnVisibility: true,
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: animationBuilder(
              (index) => InkWell(
                onTap: () {
                  categoryStateController.selectedCategory.value = list[index];
                  Get.to(() => FoodListScreen());
                },
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: list[index].image,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return Center(child: Icon(Icons.image));
                        },
                        progressIndicatorBuilder: (context, url, downloadProgress) {
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                      Container(color: Color(COLOR_OVERLAY)),
                      Center(
                        child: Text(
                          list[index].name,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jetBrainsMono(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

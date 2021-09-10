import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/model/popular_item_model.dart';
import 'package:order_food_app/state/main_state.dart';
import 'package:order_food_app/view_model/restaurant_home_detail_vm/restaurant_home_detail_vm.dart';

class BestDealsWidget extends StatelessWidget {
  const BestDealsWidget({
    Key? key,
    required this.viewModel,
    required this.mainStateController,
  }) : super(key: key);

  final RestaurantHomeDetailViewModel viewModel;
  final MainStateController mainStateController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.displayBestDealsByRestaurantId(mainStateController.selectedRestaurant.value.restaurantId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Icon(Icons.error_outline);
        } else {
          var listBestDeal = snapshot.data as List<PopularItemModel>;

          return CarouselSlider(
            items: listBestDeal
                .map(
                  (item) => Builder(builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ImageFiltered(
                              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: CachedNetworkImage(
                                imageUrl: item.image,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) {
                                  return Center(child: Icon(Icons.image));
                                },
                                progressIndicatorBuilder: (context, url, downloadProgress) {
                                  return Center(child: CircularProgressIndicator());
                                },
                              ),
                            ),
                            Center(
                              child: Text(
                                item.name,
                                style: GoogleFonts.jetBrainsMono(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlayCurve: Curves.easeIn,
              height: double.infinity,
            ),
          );
        }
      },
    );
  }
}

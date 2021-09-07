import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/model/popular_item_model.dart';
import 'package:order_food_app/state/main_state.dart';
import 'package:order_food_app/strings/restaurant_home_strings.dart';
import 'package:order_food_app/view_model/restaurant_home_vm/restaurant_home_vm.dart';
import 'package:order_food_app/widgets/common/common_widgets.dart';

class MostPopularWidget extends StatelessWidget {
  const MostPopularWidget({
    Key? key,
    required this.viewModel,
    required this.mainStateController,
  }) : super(key: key);

  final RestaurantHomeViewModel viewModel;
  final MainStateController mainStateController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.displayMostPopularByRestaurantId(mainStateController.selectedRestaurant.value.restaurantId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          var listPopular = snapshot.data as List<PopularItemModel>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mostPopularText,
                style: GoogleFonts.jetBrainsMono(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: Colors.black45,
                ),
              ),
              Expanded(
                child: LiveList(
                  showItemDuration: const Duration(milliseconds: 350),
                  showItemInterval: const Duration(milliseconds: 150),
                  reAnimateOnVisibility: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listPopular.length,
                  itemBuilder: animationBuilder(
                    (index) => Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(listPopular[index].image),
                            minRadius: 40,
                            maxRadius: 60,
                          ),
                          SizedBox(height: 10),
                          Text(
                            listPopular[index].name,
                            style: GoogleFonts.jetBrainsMono(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

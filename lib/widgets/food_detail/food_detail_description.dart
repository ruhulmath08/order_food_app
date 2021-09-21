import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/state/food_list_state.dart';

class FoodDetailDescriptionWidget extends StatelessWidget {
  const FoodDetailDescriptionWidget({
    Key? key,
    required this.foodListStateController,
  }) : super(key: key);

  final FoodListStateController foodListStateController;

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
            RatingBar.builder(
              itemBuilder: (context, _) {
                return Icon(Icons.stars, color: Colors.amber);
              },
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              onRatingUpdate: (value) {},
            ),
            SizedBox(height: 10),
            Text(
              '${foodListStateController.selectedFood.value.description}',
              style: GoogleFonts.jetBrainsMono(
                color: Colors.blueGrey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

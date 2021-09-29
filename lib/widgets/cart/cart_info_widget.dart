import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/model/cart_model.dart';
import 'package:order_food_app/utils/utils.dart';

class CartInfo extends StatelessWidget {
  const CartInfo({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              cartModel.name,
              style: GoogleFonts.jetBrainsMono(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.grey),
                SizedBox(width: 5),
                Text(
                  '${currencyFormat.format(cartModel.price)}',
                  style: GoogleFonts.jetBrainsMono(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

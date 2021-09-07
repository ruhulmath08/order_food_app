import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_food_app/state/main_state.dart';

class RestaurantHome extends StatelessWidget {
  final MainStateController mainStateController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mainStateController.selectedRestaurant.value.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: null,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {}
                  },
                ),
              ),
              Expanded(
                child: Container(color: Colors.blue),
              ),
            ],
          ),
        ));
  }
}

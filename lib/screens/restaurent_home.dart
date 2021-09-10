import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:order_food_app/screens/menu.dart';
import 'package:order_food_app/screens/restaurant_home_detail.dart';

class RestaurantHome extends StatelessWidget {
  final drawerZoomController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ZoomDrawer(
          controller: drawerZoomController,
          menuScreen: MenuScreen(zoomDrawerController: drawerZoomController),
          mainScreen: RestaurantHomeDetails(drawerZoomController),
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0,
          backgroundColor: Colors.grey[300]!,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
          openCurve: Curves.bounceInOut,
          closeCurve: Curves.ease,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:order_food_app/const/const.dart';
import 'package:order_food_app/widgets/menu/categories_menu_widget.dart';
import 'package:order_food_app/widgets/menu/home_menu_widget.dart';

class MenuScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  const MenuScreen({required this.zoomDrawerController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(COLOR_MENU_BG),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                DrawerHeader(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: Color(COLOR_ICON_DRAWER),
                          child: Icon(
                            Icons.restaurant,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 1, color: Colors.white70),
            HomeMenuWidget(zoomDrawerController: zoomDrawerController),
            Divider(thickness: 1, color: Colors.white70),
            CategoriesWidget(),
            Divider(thickness: 1, color: Colors.white70),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:order_food_app/const/const.dart';
import 'package:order_food_app/strings/restaurant_home_strings.dart';
import 'package:order_food_app/view_model/menu/menu_viewmodel_imp.dart';
import 'package:order_food_app/widgets/menu/home_menu_widget.dart';
import 'package:order_food_app/widgets/menu/menu_widget.dart';
import 'package:order_food_app/widgets/menu/menu_with_callback.dart';

class MenuScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  final viewModel = MenuViewModelImp();

  MenuScreen({required this.zoomDrawerController});

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
            HomeMenuWidget(zoomDrawerController: zoomDrawerController),
            Divider(thickness: 1),
            MenuWidget(
              callback: viewModel.backToRestaurantList,
              icon: Icons.restaurant_rounded,
              menuName: restaurantListText,
            ),
            Divider(thickness: 1),
            MenuWidget(
              callback: viewModel.navigateCategories,
              icon: Icons.list,
              menuName: categoryText,
            ),
            Divider(thickness: 1),
            Spacer(),
            Divider(thickness: 1),
            MenuWidgetCallBack(
              callback: viewModel.checkLoginState(context) ? viewModel.logout : viewModel.login,
              icon: viewModel.checkLoginState(context) ? Icons.logout : Icons.login,
              menuName: viewModel.checkLoginState(context) ? logoutText : loginText,
            ),
            Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}

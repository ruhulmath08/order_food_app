import 'package:flutter/material.dart';

abstract class MenuViewModel {
  void backToRestaurantList();
  void navigateCategories();
  void processLoginState(BuildContext context);
  bool checkLoginState(BuildContext context);
  void login(BuildContext context);
  void logout(BuildContext context);
  void navigationHome(BuildContext context);
}

import 'package:get/get.dart';
import 'package:order_food_app/screens/category.dart';

import 'menu_viewmodel.dart';

class MenuViewModelImp extends MenuViewModel {
  @override
  void navigateCategories() {
    Get.to(() => CategoryScreen());
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/flutter_auth_ui.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order_food_app/screens/category.dart';
import 'package:order_food_app/screens/restaurent_home.dart';
import 'package:order_food_app/strings/main_strings.dart';
import 'package:order_food_app/utils/const.dart';

import 'menu_viewmodel.dart';

class MenuViewModelImp extends MenuViewModel {
  @override
  void navigateCategories() {
    Get.to(() => CategoryScreen());
  }

  @override
  void backToRestaurantList() {
    Get.back(closeOverlays: true, canPop: false);
  }

  @override
  bool checkLoginState(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null ? true : false;
  }

  @override
  void login(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      FlutterAuthUi.startUi(
        items: [AuthUiProvider.phone],
        tosAndPrivacyPolicy: TosAndPrivacyPolicy(
          tosUrl: 'https://google.com',
          privacyPolicyUrl: 'https://youtube.com',
        ),
        androidOption: AndroidOption(
          enableSmartLock: false,
          showLogo: true,
          overrideTheme: true,
        ),
      ).then((value) async {
        navigationHome(context);
      }).catchError((e) {
        Get.snackbar('Error', '$e');
      });
    }
  }

  @override
  void logout(BuildContext context) {
    Get.defaultDialog(
      title: logoutTitle,
      content: Text(logoutText),
      backgroundColor: Colors.white,
      cancel: ElevatedButton(onPressed: () => Get.back(), child: Text(cancelText)),
      confirm: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) => Get.offAll(RestaurantHome()));
        },
        child: Text(
          confirmText,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  @override
  void navigationHome(BuildContext context) async {
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    var box = GetStorage();
    box.write(KEY_TOKEN, token);
  }

  @override
  void processLoginState(BuildContext context) {
    print('login clicked');
  }
}

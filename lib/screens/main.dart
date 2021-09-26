import 'dart:convert';

import 'package:auto_animated/auto_animated.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/model/cart_model.dart';
import 'package:order_food_app/model/restaurant_model.dart';
import 'package:order_food_app/screens/restaurent_home.dart';
import 'package:order_food_app/state/cart_state.dart';
import 'package:order_food_app/state/main_state.dart';
import 'package:order_food_app/strings/main_strings.dart';
import 'package:order_food_app/utils/const.dart';
import 'package:order_food_app/view_model/main_vm/main_view_model_imp.dart';
import 'package:order_food_app/widgets/common/common_widgets.dart';
import 'package:order_food_app/widgets/main/main_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp(app: app));
}

class MyApp extends StatelessWidget {
  final FirebaseApp app;

  MyApp({required this.app});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(app: app),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final FirebaseApp app;

  MyHomePage({required this.app});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel = MainViewModelImp();
  final mainStateController = Get.put(MainStateController());
  final cartStateController = Get.put(CartStateController());
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (box.hasData(MY_CART_KEY)) {
        var cartSave = await box.read(MY_CART_KEY) as String;
        if (cartSave.length > 0 && cartSave.isNotEmpty) {
          final listCart = jsonDecode(cartSave) as List<dynamic>;
          final listCartParsed = listCart.map((e) => CartModel.formJson(e)).toList();
          if (listCartParsed.length > 0) {
            cartStateController.cart.value = listCartParsed;
          }
        }
      } else {
        cartStateController.cart.value = new List<CartModel>.empty(growable: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          restaurantText,
          style: GoogleFonts.jetBrainsMono(
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: FutureBuilder(
        future: viewModel.displayRestaurantList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            var list = snapshot.data as List<RestaurantModel>;

            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: LiveList(
                showItemDuration: const Duration(milliseconds: 350),
                showItemInterval: const Duration(milliseconds: 150),
                reAnimateOnVisibility: true,
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: animationBuilder(
                  (index) => InkWell(
                    onTap: () {
                      mainStateController.selectedRestaurant.value = list[index];
                      Get.to(() => RestaurantHome());
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2.5 * 1.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RestaurantImageWidget(imageUrl: list[index].imageUrl),
                          RestaurantInfoWidget(name: list[index].name, address: list[index].address),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

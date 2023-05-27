import 'package:flutter/material.dart';
import 'package:food/controllers/cart_controller.dart';
import 'package:food/pages/auth/sign_in_page.dart';
import 'package:food/pages/auth/sign_up_page.dart';
import 'package:food/pages/food/popular_food_detail.dart';
import 'package:food/pages/food/recommended_food_detail.dart';
import 'package:food/pages/home/food_page_body.dart';
import 'package:food/pages/home/main_food_page.dart';
import 'package:food/pages/splash/splash_page.dart';
import 'package:food/routes/route_helper.dart';
import 'package:get/get.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder:(_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: SplashScreen(),
          //  home: SignInPage(),
          // home: MainFoodPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    },);
  }
}


import 'package:food/pages/address/add_address_page.dart';
import 'package:food/pages/auth/sign_in_page.dart';
import 'package:food/pages/cart/cart_page.dart';
import 'package:food/pages/food/popular_food_detail.dart';
import 'package:food/pages/food/recommended_food_detail.dart';
import 'package:food/pages/home/home_page.dart';
import 'package:food/pages/home/main_food_page.dart';
import 'package:food/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../pages/cart/cart_history.dart';

class RouteHelper{
 static const String splashPage="/splash-page";
 static const String initial="/";
 static const String popularFood="/popular-food";
 static const String recommendedFood="/recommended-food";
 static const String cartPage="/cart-page";
 static const String signIn="/sign-in";
 static const String addAddress="/add-address";
 static const String cartHistory="/cart-history";

 static String getSplashPage()=>'$splashPage';
 static String getInitial()=>'$initial';
 static String getPopularFood(int pageId, String page)=>'$popularFood?pageId=$pageId&page=$page';
 static String getRecommendedFood(int pageId, String page)=>'$recommendedFood?pageId=$pageId&page=$page';
 static String getCartPage()=>'$cartPage';
 static String getSignInPage()=>'$signIn';
 static String getAddressPage()=>'$addAddress';
 static String getCartHistory()=>'$cartHistory';

 static List<GetPage> routes=[
  GetPage(name: splashPage, page: ()=>SplashScreen()),
  GetPage(name: initial, page: ()=>HomePage()),
  GetPage(name: signIn, page: ()=>SignInPage()),

  GetPage(name: popularFood, page: (){
   var pageId=Get.parameters['pageId'];
   var page=Get.parameters['page'];
   return PopularFoodDetail(pageId: int.parse(pageId!),page:page!);
  },
    transition: Transition.fadeIn
  ),
  GetPage(name: recommendedFood, page: (){
   var pageId=Get.parameters['pageId'];
   var page=Get.parameters['page'];
   return RecommendedFoodDetail(pageId: int.parse(pageId!),page:page!);
  },
      transition: Transition.fadeIn
  ),
  GetPage(name: cartPage, page: (){
   return CartPage();
  },
  transition: Transition.fadeIn
  ),
  GetPage(name: cartHistory, page: (){
   return CartHistory();
  }),

  GetPage(name: addAddress, page: (){
   return AddAddressPage();
  }),
 ];
}
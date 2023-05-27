import 'package:flutter/material.dart';
import 'package:food/base/no_data_page.dart';
import 'package:food/controllers/cart_controller.dart';
import 'package:food/controllers/popular_product_controller.dart';
import 'package:food/pages/cart/cart_history.dart';
// import 'package:food/pages/home/main_food_page.dart';
import 'package:food/utils/app_constants.dart';
import 'package:food/utils/colors.dart';
import 'package:food/utils/dimensions.dart';
import 'package:food/widgets/Big_text.dart';
import 'package:food/widgets/app_icon.dart';
import 'package:food/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.height20,
              top: Dimensions.height20*3,
              right: Dimensions.height20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize:Dimensions.iconSize24 ,
                    ),
                  ),
                  SizedBox(width: Dimensions.height20*5,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize:Dimensions.iconSize24 ,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getCartHistory());
                    },
                    child: AppIcon(icon: Icons.shopping_cart,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize:Dimensions.iconSize24 ,
                    ),
                  )

                ],
          )),
          GetBuilder<CartController>(builder: (cartController){
            return cartController.getItems.isNotEmpty?Positioned(
                top: Dimensions.height20*5,
                right: Dimensions.height20,
                left: Dimensions.height20,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height15),
                  // color: Colors.red,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GetBuilder<CartController>(builder: (cartController){
                      var _cartList= cartController.getItems;
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_,index){
                            return SizedBox(
                              height: Dimensions.height20*5,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      var popularIndex=Get.find<PopularProductController>().popularProductList.indexOf(_cartList[index].product!);
                                      if(popularIndex>=0){
                                        Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cartpage"));
                                      }else{
                                        var recommendedIndex=Get.find<RecommendedProductController>().recommendedProductList.indexOf(_cartList[index].product!);
                                        if(recommendedIndex<0){
                                          Get.snackbar("History product", "Product review is not available for history product!",
                                            backgroundColor: AppColors.mainColor,
                                            colorText: Colors.white,
                                          );
                                        }else{
                                          Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartpage"));
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: Dimensions.height20*5,
                                      height: Dimensions.height20*5,
                                      margin: EdgeInsets.only(bottom: Dimensions.height10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit:BoxFit.cover,
                                              image: NetworkImage(
                                                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!,
                                              )
                                          ),
                                          borderRadius: BorderRadius.circular(Dimensions.height20),
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.height10,),
                                  Expanded(child: Container(
                                    height: Dimensions.height20*5,
                                    child: Column(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(text: cartController.getItems[index].name.toString(),color: Colors.black54,),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [BigText(text: cartController.getItems[index].price.toString(),color: Colors.redAccent,),
                                            Container(
                                              padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10,left: Dimensions.height10,right: Dimensions.height10),

                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                  color: Colors.white
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: (){
                                                        cartController.addItem(_cartList[index].product!, -1);
                                                      },
                                                      child: Icon(Icons.remove, color: AppColors.signColor,)),                    SizedBox(width: Dimensions.height10/2,),
                                                  BigText(text: _cartList[index].quantity.toString()),// popularProduct.inCartItems.toString()),
                                                  SizedBox(width: Dimensions.height10/2,),
                                                  GestureDetector(
                                                      onTap: (){
                                                        cartController.addItem(_cartList[index].product!, 1);
                                                      },
                                                      child: Icon(Icons.add, color: AppColors.signColor,))
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            );
                          });
                    },),
                  ),
                )):NoDataPage(text: "Your cart is empty!");
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){

        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30,left: Dimensions.height20, right: Dimensions.height20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2)

              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,left: Dimensions.height20,right: Dimensions.height20),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white
                ),
                child: cartController.getItems.isNotEmpty?Row(
                  children: [
                    SizedBox(width: Dimensions.height10/2,),
                    BigText(text: "\$"+cartController.totalAmount.toString()),

                    SizedBox(width: Dimensions.height10/2,)

                  ],
                ):Container(),
              ),
              GestureDetector(
                onTap: (){
                  //popularProduct.addItem(product);
                  Get.toNamed(RouteHelper.getAddressPage());
                  cartController.addToHistory();
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,left: Dimensions.height20,right: Dimensions.height20),

                  child: BigText(text: "Check out", color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              )
            ],
          ),
        );
      },),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/routes/route_helper.dart';
import 'package:food/utils/colors.dart';
import 'package:food/utils/dimensions.dart';
import 'package:food/widgets/Big_text.dart';
import 'package:food/widgets/account_widget.dart';
import 'package:food/widgets/app_icon.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",size: Dimensions.iconSize24,color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),

        child: Column(
          children: [
            //profile icon
            AppIcon(icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: Dimensions.height15*5,
            size: Dimensions.height15*10,),
            SizedBox(height: Dimensions.height30,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(appIcon: AppIcon(icon: Icons.person,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,),
                        bigText: BigText(text:"Srinivas")),
                    SizedBox(height: Dimensions.height20,),
                    //phone
                    AccountWidget(appIcon: AppIcon(icon: Icons.phone,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,),
                        bigText: BigText(text:"7032414455")),
                    SizedBox(height: Dimensions.height20,),
                    //email
                    AccountWidget(appIcon: AppIcon(icon: Icons.email,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,),
                        bigText: BigText(text:"srinusrinivas1345@gmail.com")),
                    SizedBox(height: Dimensions.height20,),
                    //address
                    AccountWidget(appIcon: AppIcon(icon: Icons.location_on,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,),
                        bigText: BigText(text:"F02 Nest apartments")),
                    SizedBox(height: Dimensions.height20,),
                    //lo
                    GestureDetector(
                      onTap: (){
                        Get.offNamed(RouteHelper.getSignInPage());
                      },
                      child: AccountWidget(appIcon: AppIcon(icon: Icons.logout,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                          bigText: BigText(text:"Logout")),
                    ),
                    SizedBox(height: Dimensions.height20,),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

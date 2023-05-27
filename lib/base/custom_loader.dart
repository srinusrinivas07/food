import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/controllers/auth_controller.dart';
import 'package:food/utils/colors.dart';
import 'package:food/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("i am pinting state"+Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimensions.height20*5,
        width: Dimensions.height20*5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height10*5),
          color: AppColors.mainColor
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}

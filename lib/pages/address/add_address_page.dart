import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/models/address_model.dart';
import 'package:food/utils/colors.dart';
import 'package:food/utils/dimensions.dart';
import 'package:food/widgets/Big_text.dart';
import 'package:food/widgets/app_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controllers/location_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_icon.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {

  TextEditingController _addressController=TextEditingController();
  final TextEditingController _contactPersonName=TextEditingController();
  final TextEditingController _contactPersonNumber=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address page"),
        backgroundColor: AppColors.mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: Dimensions.height20),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.height20),
              child: BigText(text: "Delivery Address"),
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: _addressController, icon: Icons.house_rounded, hintText: "Your house No"),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: _addressController, icon: Icons.map, hintText: "Your Street"),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: _addressController, icon: Icons.maps_home_work_outlined, hintText: "Your state"),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: _addressController, icon: Icons.pin_drop, hintText: "Your Pin code"),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: _contactPersonName, icon: Icons.person, hintText: "Your name"),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: _contactPersonNumber, icon: Icons.phone, hintText: "Your number"),

          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<LocationController>(builder: (locationController){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: Dimensions.font26),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getCartHistory());
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,left: Dimensions.height20,right: Dimensions.height20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                        child: BigText(text: "Save address", color: Colors.white,),
                      ),
                  ),
                ),

              ],

            )
          ],
        );
      }),
    );
  }
}

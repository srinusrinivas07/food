import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/dimensions.dart';
import 'package:food/widgets/Big_text.dart';
import 'package:food/widgets/app_icon.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({Key? key,required this.appIcon,required this.bigText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: Dimensions.height20,
      top: Dimensions.height10,bottom: Dimensions.height10
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.height20,),
          bigText
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0,2),
            color: Colors.grey.withOpacity(0.2),
          )
        ]
      ),
    );
  }
}

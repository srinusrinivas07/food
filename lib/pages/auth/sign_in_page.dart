import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food/base/custom_loader.dart';
import 'package:food/pages/auth/sign_up_page.dart';
import 'package:food/routes/route_helper.dart';
import 'package:food/utils/colors.dart';
import 'package:food/utils/dimensions.dart';
import 'package:food/widgets/Big_text.dart';
import 'package:food/widgets/app_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    _login(AuthController authController){
      String email=emailController.text.trim();
      String password=passwordController.text.trim();
      if(email.isEmpty){
        showCustomSnackBar("Type in your email address",title: "Email address");
      }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
        showCustomSnackBar("Type in your valid email address",title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password",title: "Password");
      }else if(password.length<6){
        showCustomSnackBar("Password cannot be less than six characters",title: "Valid password");
      }else{

        authController.login(email, password).then((status){
          if(status.isSuccess){
            // Get.toNamed(RouteHelper.getInitial());
            Get.toNamed(RouteHelper.getInitial());
            print("Success login");
          }else{
            Get.toNamed(RouteHelper.getInitial());
            print("fuck off");
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading?
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.05,),
              // app logo
              Container(
                height: Dimensions.screenHeight*0.25,
                child:Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.height20*4,
                    backgroundImage: AssetImage(
                        "assets/image/logo1.jpg"
                    ),
                  ),
                ),
              ),
              //welcome
              Container(
                margin: EdgeInsets.only(left: Dimensions.height20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello",
                      style: TextStyle(
                          fontSize: Dimensions.font20*3+Dimensions.font20/2,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("  Welcome back, Sign in to access your account",
                      style: TextStyle(
                          fontSize: Dimensions.font16,
                          color: Colors.grey[500]
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              //email
              AppTextField(textController: emailController, icon: Icons.email, hintText: "Email"),
              SizedBox(height: Dimensions.height20,),
              //password
              AppTextField(textController: passwordController, icon: Icons.password_sharp,isObscure: true, hintText: "Password"),
              SizedBox(height: Dimensions.height10,),
              //tag line
              Row(

              ),
              SizedBox(height: Dimensions.screenHeight*0.05,),
              //sign in
              GestureDetector(
                onTap: (){
                  _login(authController);
                },
                child: Container(
                  width: Dimensions.screenWidth/2.2,
                  height: Dimensions.screenHeight/14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: "Sign in",
                      size: Dimensions.height30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.screenHeight*0.05,),
              RichText(
                  text: TextSpan(
                      text: "Don\'t have an account? ",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font16,
                      ),
                      children:[
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fadeIn),
                          text: "Create",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainBlackColor,
                            fontSize: Dimensions.font20,
                          ),)

                      ]
                  )
              ),

            ],
          ),
        ):
        CustomLoader();
      })
    );
  }
}

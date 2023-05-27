import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food/base/custom_loader.dart';
import 'package:food/base/show_custom_snackbar.dart';
import 'package:food/controllers/auth_controller.dart';
import 'package:food/models/signup_body_model.dart';
import 'package:food/utils/colors.dart';
import 'package:food/utils/dimensions.dart';
import 'package:food/widgets/Big_text.dart';
import 'package:food/widgets/app_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/route_helper.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    var nameController=TextEditingController();
    var phoneController=TextEditingController();
    var signUpImages= [
      "t.png",
      "f.png",
      "g.jpeg"
    ];
       _registration(AuthController authController){
      String name=nameController.text.trim();
      String phone=phoneController.text.trim();
      String email=emailController.text.trim();
      String password=passwordController.text.trim();
      if(name.isEmpty){
        showCustomSnackBar("Type in your name",title: "Name");
      }else if(phone.isEmpty){
        showCustomSnackBar("Type in your phone number",title: "Phone number");
      }else if(phone.length<10){
        showCustomSnackBar("Enter valid phone number",title: "valid phone");
      }else if(email.isEmpty){
        showCustomSnackBar("Type in your email address",title: "Email address");
      }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
        showCustomSnackBar("Type in your valid email address",title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password",title: "Password");
      }else if(password.length<6){
        showCustomSnackBar("Password cannot be less than six characters",title: "Valid password");
      }else{
        SignUpBody signUpBody=SignUpBody(name: name, password: password, email: email, phone: phone);
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            // showCustomSnackBar(status.message);
            Get.toNamed(RouteHelper.getInitial());
            print("Success registration");
          }else{
            showCustomSnackBar("Email ID already present");
          }
        });
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading?SingleChildScrollView(
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
              //email
              AppTextField(textController: emailController, icon: Icons.email, hintText: "Email"),
              SizedBox(height: Dimensions.height20,),
              //password
              AppTextField(textController: passwordController, icon: Icons.password_sharp,isObscure: true, hintText: "Password"),
              SizedBox(height: Dimensions.height20,),
              //name
              AppTextField(textController: nameController, icon: Icons.person, hintText: "Name"),
              SizedBox(height: Dimensions.height20,),
              //phone
              AppTextField(textController: phoneController, icon: Icons.phone, hintText: "Phone"),
              SizedBox(height: Dimensions.height20*2,),

              GestureDetector(
                onTap: (){
                  return _registration(_authController);
                  // print("am tapped");
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
                      text: "Sign up",
                      size: Dimensions.height30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              RichText(text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Have an account already?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey[500],
                    fontSize: Dimensions.height15,
                  )
              )
              ),
              SizedBox(height: Dimensions.screenHeight*0.05,),
              RichText(text: TextSpan(
                  text: "Sign up using one of the following method",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.height15,
                  )
              )
              ),
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Dimensions.height30,
                    backgroundColor: AppColors.mainColor,
                    backgroundImage: AssetImage(
                        "assets/image/"+signUpImages[index]
                    ),
                  ),
                )),
              )

            ],
          ),
        ):
        const CustomLoader();
      })
    );
  }
}

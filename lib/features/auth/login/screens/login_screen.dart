import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/widgets/custom_text_field.dart';
import 'package:ai_movie_app/core/widgets/main_button.dart';
import 'package:ai_movie_app/core/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height ;
    final screenWidth = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text("Login",style:AppTextStyle.H4Semibold600AppBar),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Image.asset(AppImages.iconBack,)),
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.mainColor,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.030),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxFun(screenHeight: screenHeight*0.050,),
              Text('Hi, Tiffany',style: AppTextStyle.simiBold600S24,),
              sizedBoxFun(screenHeight: screenHeight*0.008,),
              Text('Welcome back! Please enter \n your details.',style: AppTextStyle.H6Medium500S12,textAlign: TextAlign.center,),
              SizedBox(
                height: screenHeight*0.070,
              ),
              CustomTextField(labelText: "Email Address",),
              sizedBoxFun(screenHeight: screenHeight*0.030,),
              PasswordTextField(labelText: 'Password',),
              sizedBoxFun(screenHeight: screenHeight*0.008,),

              Align(
                  alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.resetPassword);
                      },
                        child: Text("Forgot Password?",style: AppTextStyle.H4Semibold500S14,))),
              sizedBoxFun(screenHeight: screenHeight*0.050,),
              MainButton(label: 'Login',navigate: (){
                Navigator.pushReplacementNamed(context, Routes.homeMainScreen);
              },),

            ],
          ),
        ),
      ),
    );

  }
  sizedBoxFun({double? screenHeight,double?screenWidth}){
    return  SizedBox(
      height: screenHeight,
      width: screenWidth,
    );
  }
}

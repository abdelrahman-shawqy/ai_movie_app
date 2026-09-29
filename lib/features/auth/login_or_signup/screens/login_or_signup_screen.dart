import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/widgets/main_button.dart';
import 'package:ai_movie_app/features/auth/login_or_signup/widget/icon_signup.dart';
import 'package:flutter/material.dart';

class LoginOrSignupScreen extends StatelessWidget {
  const LoginOrSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height ;
    final screenWidth = MediaQuery.of(context).size.width ;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Container(
          width: double.infinity,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:screenWidth*0.050),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight*0.130
                ),
                Image.asset(AppImages.logoSignUpLogin),
                SizedBox(
                  height: screenHeight*0.075,
                ),
                MainButton(label: "Sign Up",navigate:() => Navigator.pushNamed(context,Routes.signUpScreen) ,),
                SizedBox(
                  height: screenHeight*0.044,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I already have an account?  ",style: AppTextStyle.H4Medium500S16,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.loginScreen);
                      },
                        child: Text("Login",style: AppTextStyle.H4Semibold600S16,)),

                  ],
                ),
                SizedBox(
                  height: screenHeight*0.060,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: Color(0xff252836),thickness: 1.5,indent: screenWidth*0.080,)),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.018),
                      child: Text("Or Sign up with",style: AppTextStyle.H4Medium500S16,),
                    ),
                    Expanded(child: Divider(color: Color(0xff252836),thickness: 1.5,endIndent: screenWidth*0.080,)),

                  ],
                ),
                SizedBox(
                  height: screenHeight*0.056,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconSignupWith(image: AppImages.googleIcon,color: AppColors.whiteColor,),
                    SizedBox(
                      width: screenWidth*0.060
                    ),
                    IconSignupWith(image: AppImages.facebookIcon,color: AppColors.faceBook,),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

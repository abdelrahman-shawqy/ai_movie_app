import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/widgets/custom_text_field.dart';
import 'package:ai_movie_app/core/widgets/main_button.dart';
import 'package:ai_movie_app/core/widgets/password_text_field.dart';
import 'package:ai_movie_app/features/auth/sign_up/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height ;
    final screenWidth = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text("Sign Up",style:AppTextStyle.H4Semibold600AppBar),
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
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              sizedBoxFun(screenHeight:screenHeight*0.050,),
              Text('Let’s get started',style: AppTextStyle.simiBold600S24,),
              sizedBoxFun(screenHeight:screenHeight*0.008,),
              Text('The latest movies and series\n are here',style: AppTextStyle.H6Medium500S12,textAlign: TextAlign.center,),
              SizedBox(
                height: screenHeight*0.070,
              ),
              CustomTextField(labelText:"Full Name",),
              sizedBoxFun(screenHeight: screenHeight*0.030,),
              CustomTextField(labelText:"Email Address",),
              sizedBoxFun(screenHeight: screenHeight*0.030,),
              PasswordTextField(labelText:'Password',),
              sizedBoxFun(screenHeight: screenHeight*0.016,),
              Row(
                children: [
                  CustomCheckBox(),
                  Text.rich(
                      TextSpan(
                        style: AppTextStyle.H6Medium500S12,
                        children: [
                          TextSpan(text:"I agree to the "),
                          TextSpan(
                            text: "Terms and Services\n ",
                            style: AppTextStyle.H4Semibold500S14,
                          ),
                          TextSpan(
                            text: 'end '
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: AppTextStyle.H4Semibold500S14,
                          )
                        ],
                      ),
                  ),
                ],
              ),
              sizedBoxFun(screenHeight: screenHeight*0.050,),
              MainButton(label:'Sign Up',navigate: (){},),
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

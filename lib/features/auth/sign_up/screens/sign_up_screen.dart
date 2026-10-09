import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/widgets/custom_text_field.dart';
import 'package:ai_movie_app/core/widgets/main_button.dart';
import 'package:ai_movie_app/core/widgets/password_text_field.dart';
import 'package:ai_movie_app/features/auth/sign_up/widgets/custom_check_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController ;
  late TextEditingController nameController ;
  late TextEditingController passWordController ;
  @override
  void initState() {
    super.initState();
    emailController =  TextEditingController();
    nameController =  TextEditingController();
    passWordController =  TextEditingController();
  }
  @override
  void dispose() {
    emailController .dispose() ;
    nameController .dispose() ;
    passWordController .dispose() ;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text("Sign Up", style: AppTextStyle.H4Semibold600AppBar),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppImages.iconBack),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.mainColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.030),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxFun(screenHeight: screenHeight * 0.050),
                Text('Let’s get started', style: AppTextStyle.simiBold600S24),
                sizedBoxFun(screenHeight: screenHeight * 0.008),
                Text(
                  'The latest movies and series\n are here',
                  style: AppTextStyle.H6Medium500S12,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.070),
                CustomTextField(
                  controller:nameController ,
                  labelText: "Full Name",
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return ' Please Enter Name ';
                    }
                    return null;
                  },
                ),
                sizedBoxFun(screenHeight: screenHeight * 0.030),
                CustomTextField(
                  controller: emailController,
                  labelText: "Email Address",
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter Email ';
                    }
                    final bool emailValid  = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(text);
                    if(!emailValid){
                      return 'Please Enter Valid Email ';
                    }
                    return null ;
                  },
                ),
                sizedBoxFun(screenHeight: screenHeight * 0.030),
                PasswordTextField(
                  passWordController: passWordController,
                  labelText: 'Password',
                  validator: (text) {
                    if(text==null||text.trim().isEmpty){
                      return ' Please enter PassWord';
                    }
                    if(text.length < 6){
                      return 'The PassWord Must Be Bigger Than 6 char';
                    }
                    return null;
                  },
                ),
                sizedBoxFun(screenHeight: screenHeight * 0.016),
                Row(
                  children: [
                    CustomCheckBox(),
                    Text.rich(
                      TextSpan(
                        style: AppTextStyle.H6Medium500S12,
                        children: [
                          TextSpan(text: "I agree to the "),
                          TextSpan(
                            text: "Terms and Services\n ",
                            style: AppTextStyle.H4Semibold500S14,
                          ),
                          TextSpan(text: 'end '),
                          TextSpan(
                            text: "Privacy Policy",
                            style: AppTextStyle.H4Semibold500S14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                sizedBoxFun(screenHeight: screenHeight * 0.050),
                MainButton(label: 'Sign Up',
                    onPressed:signUp
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }

  void signUp()async{
    if(formKey.currentState?.validate()==true){
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passWordController.text,
        );
        print('#### signUp succfully ');
        print('#### user id = ${credential.user?.uid ?? 'it is nulllll'} ');
        Navigator.pushNamed(context, Routes.loginScreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

  }
}

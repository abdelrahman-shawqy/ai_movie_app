import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/widgets/custom_text_field.dart';
import 'package:ai_movie_app/core/widgets/main_button.dart';
import 'package:ai_movie_app/core/widgets/password_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final formKey = GlobalKey<FormState>();
   late TextEditingController emailController ;
   late TextEditingController passWordController ;
   @override
   void initState() {
     super.initState();
     emailController =  TextEditingController();
     passWordController =  TextEditingController();
   }
   @override
   void dispose() {
     emailController .dispose() ;
     passWordController .dispose() ;
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text("Login", style: AppTextStyle.H4Semibold600AppBar),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(AppImages.iconBack,)),
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
                sizedBoxFun(screenHeight: screenHeight * 0.050,),
                Text('Hi, Tiffany', style: AppTextStyle.simiBold600S24,),
                sizedBoxFun(screenHeight: screenHeight * 0.008,),
                Text('Welcome back! Please enter \n your details.',
                  style: AppTextStyle.H6Medium500S12,
                  textAlign: TextAlign.center,),
                SizedBox(
                  height: screenHeight * 0.070,
                ),
                CustomTextField(
                  controller: emailController,
                  labelText: "Email Address",
                  validator: (text) {
                  if(text==null||text.trim().isEmpty){
                    return 'Please Enter Email';
                  }
                  final bool emailValid = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  ).hasMatch(text);
                  if(!emailValid){
                    return 'Please Enter Valid Email ';
                  }
                  return null ;
                  },),
                sizedBoxFun(screenHeight: screenHeight * 0.030,),
                PasswordTextField(
                  passWordController: passWordController,
                  labelText: 'Password', validator: (text) {
                  if(text==null||text.trim().isEmpty){
                    return ' Please Enter Password';
                  }
                  if(text.length<6){
                    return 'The Password Must Be Bigger Than 6 char';
                  }
                  return null;
                },),
                sizedBoxFun(screenHeight: screenHeight * 0.008,),

                Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.resetPassword);
                        },
                        child: Text("Forgot Password?",
                          style: AppTextStyle.H4Semibold500S14,))),
                sizedBoxFun(screenHeight: screenHeight * 0.050,),

                MainButton(label: 'Login', onPressed:login,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  sizedBoxFun({double? screenHeight, double?screenWidth}) {
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
    );
  }
  /// todo add to clean arch
  void login()async {
    if(formKey.currentState?.validate()==true){
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passWordController.text
        );
        print('####login succfully ');
        print('#### user id = ${credential.user?.uid ?? 'it is nulllll ' } ');
        Navigator.pushNamed(context, Routes.homeMainScreen);

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
      catch(e){
        print('ther is exception #### ${e.toString()}');
      }
    }
  }
}

import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
   const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
   late  TextEditingController controller ;
   @override
   void initState() {
     super.initState();
     controller =  TextEditingController();
   }
   @override
   void dispose() {
     controller .dispose() ;
     super.dispose();
   }
   @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height ;
    final screenWidth = MediaQuery.of(context).size.width ;
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.all(8),
      width:screenWidth*0.190,
      height: screenHeight*0.080,
      textStyle: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: AppColors.PrimarySoft,
        border: Border.all(color:Colors.transparent),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
        decoration: BoxDecoration(
      border: BoxBorder.all(color: AppColors.primaryBlueAccent),
      borderRadius: BorderRadius.circular(20),

    ),
      textStyle: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w600)
    );

    return  Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Image.asset(AppImages.iconBack,)),
      ),
      body:Container(
        width: double.infinity,
        color: AppColors.mainColor,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.030),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxFun(screenHeight: screenHeight*0.050,),
              Text('Verifying your account',style: AppTextStyle.simiBold600S24,),
              sizedBoxFun(screenHeight: screenHeight*0.008,),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We have just sent you 4 digit code via your email',
                      style: AppTextStyle.h5Medium500S14,
                    ),
                    TextSpan(
                      text: ' example@gmail.com',
                      style: AppTextStyle.H6Medium500S12
                    )
                  ]
                ),
              ),
              sizedBoxFun(screenHeight: screenHeight*0.050,),
              Pinput(
                controller:controller ,
                animationCurve: Curves.easeInOutBack,
                animationDuration: Duration(milliseconds: 100),
                  defaultPinTheme :defaultPinTheme ,
                focusedPinTheme:focusedPinTheme ,
              ),
              sizedBoxFun(screenHeight: screenHeight*0.050,),
              MainButton(label: 'Continue',onPressed: (){
                Navigator.pushReplacementNamed(context, Routes.createNewPassword);
              },),

            ],
          ),
        ),
      ) ,
    );
  }

  sizedBoxFun({double? screenHeight,double?screenWidth}){
    return  SizedBox(
      height: screenHeight,
      width: screenWidth,
    );
  }
}

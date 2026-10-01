import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.labelText});
  final String labelText ;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height ;
    final screenWidth = MediaQuery.of(context).size.width ;
    final TextEditingController emailController = TextEditingController();
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.020),
      child: SizedBox(
        height: screenHeight*0.065,
        child: TextField(
          cursorColor: AppColors.whiteGrey,
          controller:emailController ,
          style: AppTextStyle.h5Medium500S14,
          decoration: InputDecoration(

            contentPadding: EdgeInsets.only(top:screenHeight*0.050,left:screenWidth*0.035),
            labelText: labelText,
            labelStyle: AppTextStyle.H6Medium500S12,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.white38, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color:Colors.white38, width: 1),
            ),

          ),
        ),
      ),
    );
  }
}

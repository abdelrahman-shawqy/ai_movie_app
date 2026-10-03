import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SelectedIcon extends StatelessWidget {
  const SelectedIcon({super.key,required this.imageIcon,required this.label});
  final String imageIcon ;
  final String label  ;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height ;
    final screenWidth = MediaQuery.of(context).size.width ;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.PrimarySoft,
        borderRadius: BorderRadius.circular(16)
      ),
      height:screenHeight * 0.06,
      width: screenWidth * 0.95,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageIcon,color: AppColors.primaryBlueAccent,),
            SizedBox(
              width: 6,
            ),
            Text(label,style: AppTextStyle.H6Medium500S12primaryBlueAccent,)
          ],
        ),
      ),
    );
  }
}

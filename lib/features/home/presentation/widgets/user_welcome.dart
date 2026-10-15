import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserWelcome extends StatelessWidget {
  const UserWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return  Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.052,
        left: screenWidth * 0.040,
        right: screenWidth * 0.024,
        bottom: screenHeight * 0.032,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(38),
            child: Image.asset(AppImages.profilePic,height:screenHeight *0.050,width:screenHeight*0.050,fit: BoxFit.cover,),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.035),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Hello, Smith\n',
                    style: AppTextStyle.H4Semibold600S16White,
                  ),
                  TextSpan(
                    text: 'Let’s stream your favorite movie',
                    style: AppTextStyle.H6Medium500S12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

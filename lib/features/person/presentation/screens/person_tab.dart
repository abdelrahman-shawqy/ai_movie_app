import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/profile.dart';
import 'package:flutter/material.dart';

class PersonTab extends StatelessWidget {
  const PersonTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:screenWidth*0.054),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:screenHeight*0.050,width: double.infinity,),
            Text('Profile',style: AppTextStyle.H4Semibold600S16White,),
            Profile(),

          ],
        ),
      ),
    );
  }
}

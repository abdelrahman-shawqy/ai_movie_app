import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/constants/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 503,
          color: AppColors.BlackColorOnBord,
          child: Image.asset(
            AppImages.secondOnboardingScreen,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 37),
        Text(
          'Lorem ipsum dolor sit \n amet consecteur esplicit',
          style: AppTextStyle.simiBold600S24,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 14),
        Text(
            'Semper in cursus magna et eu varius nunc \n adipiscing. Elementum justo, laoreet id sem \n semper parturient. ',
            style: AppTextStyle.h5Medium,
            textAlign: TextAlign.center
        ),
      ],
    );
  }
}

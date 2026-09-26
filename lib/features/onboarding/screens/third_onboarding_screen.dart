import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ThirdOnboardingScreen extends StatelessWidget {
  const ThirdOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                AppImages.thirdOnboardingScreen,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 24,
                right: 32,

                child: Image.asset(AppImages.durationOnboardingScreen)),
            Positioned(
              left: 36,
                top: 8,
                child: Image.asset(AppImages.ratingOnboardingScreen))

          ],
        ),
        SizedBox(height: 46),
        Text(
          'Lorem ipsum dolor sit amet \n consecteur esplicit',
          style: AppTextStyle.simiBold600,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 14),
        Text(
            'Semper in cursus magna et eu \n varius nunc adipiscing. Elementum \n justo, laoreet id sem semper\n parturient. ',
            style: AppTextStyle.h5Medium,
            textAlign: TextAlign.center
        ),
      ],
    );
  }
}

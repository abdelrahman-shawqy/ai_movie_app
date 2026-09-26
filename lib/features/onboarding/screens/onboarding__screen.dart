import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/onboarding/screens/first%20screen.dart';
import 'package:ai_movie_app/features/onboarding/screens/second_screen.dart';
import 'package:ai_movie_app/features/onboarding/wdgets/custom_indicator.dart';
import 'package:ai_movie_app/features/onboarding/wdgets/custom_paint_border.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'third_onboarding_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int pageIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (index) {
                  print("PAGE CHANGED = $index");

                  setState(() {
                    pageIndex = index;
                  });
                  print("############# ${pageIndex}");
                },
                controller: pageController,
                children: [
                 FirstScreen(),
                  SecondScreen(),
                  ThirdOnboardingScreen(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 47,
                bottom: 61,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIndicator(index: pageIndex),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaintBorder(),
                      InkWell(
                        onTap: () async {
                          if (pageIndex < 2) {
                            print("BEFORE = $pageIndex");
                            // TODO: fix the change first screen with botton

                            await pageController.animateToPage(
                              pageIndex + 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOutBack,
                            );
                            print("AFTER = ${pageController.page}");

                          }
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 60,
                          width: 60,
                          child: Image.asset(AppImages.arrowRightIcon),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlueAccent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  late Animation<double> opacity;

  late Animation<double> scale;

  late AnimationController controller;

  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));
    scale = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));
    controller.forward();
    Timer(Duration(seconds: 3),(){
      if(mounted){
        controller.reverse().then((_) {
          Navigator.of(context).pushReplacementNamed(Routes.onBoardingScreen);
        });
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: ScaleTransition(
          scale: scale,
          child: FadeTransition(
            opacity: opacity,
            child: Image.asset(AppImages.splashIcon),
          ),
        ),
      ),
    );
  }
}

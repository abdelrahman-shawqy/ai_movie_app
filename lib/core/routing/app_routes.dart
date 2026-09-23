import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/features/onboarding/screens/onboarding__screen.dart';
import 'package:ai_movie_app/features/splash_screen/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static Route<dynamic> onGenerateRoute (RouteSettings setting){
    switch(setting.name){
      case Routes.splashScreen :
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
    case Routes.onBoardingScreen :
    return MaterialPageRoute(builder: (_)=>const OnBoardingScreen());
        default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          ),
        );
    }
  }
}
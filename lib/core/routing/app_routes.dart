import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/features/auth/forgot_password/screens/create_new_password.dart';
import 'package:ai_movie_app/features/auth/forgot_password/screens/reset_password_screen.dart';
import 'package:ai_movie_app/features/auth/forgot_password/screens/verification_screen.dart';
import 'package:ai_movie_app/features/auth/login/screens/login_screen.dart';
import 'package:ai_movie_app/features/auth/login_or_signup/screens/login_or_signup_screen.dart';
import 'package:ai_movie_app/features/auth/sign_up/screens/sign_up_screen.dart';
import 'package:ai_movie_app/features/home/presentation/screens/home_main_screen.dart';
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
      case Routes.loginOrSignUpScreen :
        return MaterialPageRoute(builder: (_)=>const LoginOrSignupScreen());
      case Routes.loginScreen :
        return MaterialPageRoute(builder: (_)=> const LoginScreen());
      case Routes.signUpScreen :
        return MaterialPageRoute(builder: (_)=> const SignUpScreen());
      case Routes.resetPassword :
        return MaterialPageRoute(builder: (_)=> const ResetPasswordScreen());
case Routes.verificationScreen :
        return MaterialPageRoute(builder: (_)=>  VerificationScreen());
      case Routes.createNewPassword :
        return MaterialPageRoute(builder: (_)=>const CreateNewPassword());
      case Routes.homeMainScreen :
        return MaterialPageRoute(builder: (_)=>const  HomeMainScreen());

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
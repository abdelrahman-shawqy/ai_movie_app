import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/features/auth/forgot_password/screens/create_new_password.dart';
import 'package:ai_movie_app/features/auth/forgot_password/screens/reset_password_screen.dart';
import 'package:ai_movie_app/features/auth/forgot_password/screens/verification_screen.dart';
import 'package:ai_movie_app/features/auth/login/screens/login_screen.dart';
import 'package:ai_movie_app/features/auth/login_or_signup/screens/login_or_signup_screen.dart';
import 'package:ai_movie_app/features/auth/sign_up/screens/sign_up_screen.dart';
import 'package:ai_movie_app/features/home/presentation/screens/home_main_screen.dart';
import 'package:ai_movie_app/features/movie_detail/presentation/screens/movie_details_screen.dart';
import 'package:ai_movie_app/features/onboarding/screens/onboarding__screen.dart';
import 'package:ai_movie_app/features/person/presentation/screens/language_screen.dart';
import 'package:ai_movie_app/features/person/presentation/screens/notification_screen.dart';
import 'package:ai_movie_app/features/splash_screen/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/ai_chat_bot/presentation/screens/ai_screen.dart';
import '../../features/person/presentation/screens/edit_profile_screen.dart';
import '../../features/person/presentation/screens/privacy_policy_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginOrSignUpScreen:
        return MaterialPageRoute(builder: (_) => const LoginOrSignupScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.verificationScreen:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case Routes.createNewPassword:
        return MaterialPageRoute(builder: (_) => const CreateNewPassword());
      case Routes.homeMainScreen:
        return MaterialPageRoute(builder: (_) => const HomeMainScreen());
        case Routes.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
        case Routes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
        case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
        case Routes.privacyPolicyScreen:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
        case Routes.aiScreen:
        return MaterialPageRoute(builder: (_) => const AiScreen());
      case Routes.movieDetailsScreen:
        final argument=setting.arguments as Map<String,dynamic>  ;
        return MaterialPageRoute(
            builder: (_) =>  MovieDetailsScreen(
              title: argument['title'] as String ,
              voteAverage: argument['voteAverage'] as String ,
              releaseDate: argument['releaseDate'] as String ,
              posterPath: argument['posterPath'] as String ,
              overview: argument['overview'] as String ,
              movieId: argument['movieId'] as int ,

            ));

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}

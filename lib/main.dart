import 'package:ai_movie_app/core/dependency%20_injection/di.dart';
import 'package:ai_movie_app/core/observer/bloc_observer.dart';
import 'package:ai_movie_app/core/routing/app_routes.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.onBoardingScreen,
      onGenerateRoute:AppRoutes.onGenerateRoute ,
    );
  }
}



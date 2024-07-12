import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/onboarding/onboarding_Screen.dart';
import 'package:flutter/material.dart';

import '../../features/login/ui/login_screen.dart';

class AppRouter{

 /*  final arguments =settings.arguments;*/
  Route generateRoute(RouteSettings setting){
    switch (setting.name){
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_)=>const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=>const LoginScreen(),
        );
      default:
        return MaterialPageRoute(builder: (_)=>Scaffold(
          body: Center(
            child: Text('no route defined for ${setting.name}'),
          ),
        ));
    }
  }
}
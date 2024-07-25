import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/onboarding/onboarding_Screen.dart';
import 'package:docdoc/features/sign_ip/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/home_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/sign_ip/logic/sign_up_cubit.dart';
import '../../features/sign_ip/ui/sign_up_screen.dart';

class AppRouter {

  /*  final arguments =settings.arguments;*/
  Route ? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen(),
            ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: const SignupScreen(),
              ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => HomeCubit(getIt())..getSpecializations(),
              child: HomeScreen(),
            ),
        );
      default:
        return null;
    }
  }
}
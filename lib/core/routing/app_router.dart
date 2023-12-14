import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/home/ui/home_screen.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/ui/login_screen.dart';

import 'package:flutter_complete_project/features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  // this arguments to be passed in any screen like this ( arguments as ClassName)
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>  BlocProvider(
            create: (context)=> getIt<LoginCubit>(),
            child: const LoginScreen()));

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) =>  BlocProvider(
            create: (context)=> getIt<LoginCubit>(),
            child: const HomeScreen()));

      default:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    }
  }
}

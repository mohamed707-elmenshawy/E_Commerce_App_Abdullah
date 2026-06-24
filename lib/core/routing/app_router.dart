import 'package:e_commerce/core/di/dependency_injection.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/features/home/UI/home_screen.dart';
import 'package:e_commerce/features/login/UI/login_screen.dart';
import 'package:e_commerce/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}

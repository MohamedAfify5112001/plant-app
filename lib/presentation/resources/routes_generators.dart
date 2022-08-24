import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/presentation/Layout/home-screen/view_model/home_cubit.dart';
import 'package:plant_app/presentation/auth/auth_screen.dart';
import 'package:plant_app/presentation/layout/view/layout.dart';
import 'package:plant_app/presentation/layout/view_model/layout_cubit.dart';
import 'package:plant_app/presentation/resources/routes_manager.dart';
import 'package:plant_app/presentation/splash-screen/splash_screen.dart';

import '../layout/home-screen/view/home_screen.dart';


class RoutesGenerator {
  static Route<dynamic> getScreenRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.$SplashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.$AuthScreenRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );
    }
  }
}

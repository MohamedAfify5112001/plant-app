import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/presentation/Layout/home-screen/view_model/home_cubit.dart';
import 'package:plant_app/presentation/add-post/view_model/add_post_cubit.dart';
import 'package:plant_app/presentation/forums/view/forums_screen.dart';
import 'package:plant_app/presentation/layout/blog-screen/view_model/blog_cubit.dart';
import 'package:plant_app/presentation/layout/home-screen/view/home_screen.dart';
import 'package:plant_app/presentation/layout/notification-screen/view/notification_screen.dart';
import 'package:plant_app/presentation/layout/profile-screen/view/profile_screen.dart';
import 'package:plant_app/presentation/layout/profile-screen/view_model/profile_data.dart';
import 'package:plant_app/presentation/layout/view/layout.dart';
import 'package:plant_app/presentation/layout/view_model/layout_cubit.dart';
import 'package:plant_app/presentation/login-screen/view_model/login_cubit.dart';
import 'package:plant_app/presentation/questions/view/quiz_screen.dart';
import 'package:plant_app/presentation/questions/view_model/quiz_cubit.dart';
import 'package:plant_app/presentation/register-screen/view_model/register_cubit.dart';
import 'package:plant_app/presentation/reset-password/view/reset_password.dart';
import 'package:plant_app/presentation/resources/routes_generators.dart';
import 'package:plant_app/presentation/resources/routes_manager.dart';

import '../presentation/forget-password/view/forget_password_screen.dart';
import '../presentation/forums/view_model/forums_cubit.dart';
import '../presentation/resources/theme.dart';

class MyPlantApp extends StatelessWidget {
  MyPlantApp._internal();

  static MyPlantApp get instance => MyPlantApp._internal();

  factory MyPlantApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginCubit(),
        ),
        BlocProvider(
          create: (_) => RegisterCubit(),
        ),
        BlocProvider(
          create: (_) => LayoutCubit(),
        ),
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        BlocProvider(
          create: (_) => BlogCubit(),
        ),
        BlocProvider(
          create: (_) => QuizCubit(),
        ),
        BlocProvider(
          create: (_) => AddPostCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesGenerator.getScreenRoute,
        initialRoute: AppRoutes.$SplashScreenRoute,
        theme: getAppTheme(),
      ),
    );
  }
}

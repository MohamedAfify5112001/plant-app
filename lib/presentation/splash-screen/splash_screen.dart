import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_app/presentation/resources/assets_manager.dart';
import 'package:plant_app/presentation/resources/routes_manager.dart';

import '../shared/components/image_comp.dart';
import '../shared/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _splashDelayBind() {
    _timer = Timer(const Duration(seconds: AppConstants.delay), _nextScreen);
  }

  _nextScreen() {
    Navigator.pushReplacementNamed(context, AppRoutes.$AuthScreenRoute);
  }

  @override
  void initState() {
    _splashDelayBind();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AssetImageComponent(path: AssetsManager.splashLogo),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plant_app/presentation/login-screen/view/login_screen.dart';
import 'package:plant_app/presentation/register-screen/view/register_screen.dart';
import 'package:plant_app/presentation/resources/assets_manager.dart';
import 'package:plant_app/presentation/resources/colors.dart';
import 'package:plant_app/presentation/shared/components/image_comp.dart';
import 'package:plant_app/presentation/shared/components/svg_img.dart';
import 'package:plant_app/presentation/shared/constants/constants.dart';

import '../resources/fonts_manager.dart';
import '../resources/values_manager.dart';
import '../shared/components/sized_box.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Background(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p25, vertical: AppPadding.p20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        getSizedBoxForHeight(height: 128),
                        const AssetImageComponent(
                          path: AssetsManager.splashLogo,
                          width: AppSizes.$200,
                          height: AppSizes.s35,
                        ),
                        getSizedBoxForHeight(height: AppSizes.s55),
                        _buildTabBarForAuth(context),
                        getSizedBoxForHeight(height: AppSizes.s40),
                        SizedBox(
                          height: 600,
                          child: TabBarView(
                            physics: const BouncingScrollPhysics(),
                            controller: _tabController,
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p16),
                                child: RegisterScreen(),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p16),
                                child: LoginScreen(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  TabBar _buildTabBarForAuth(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelColor: ColorsManager.primaryColor,
      unselectedLabelColor: ColorsManager.firstGreyColor,
      labelStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
          fontSize: AppSizes.s18, fontWeight: FontsWeightManager.$RobotoBold),
      unselectedLabelStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
          fontSize: AppSizes.s18,
          fontWeight: FontsWeightManager.$RobotoRegular),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: ColorsManager.primaryColor, width: 4),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: const [
        Tab(
          text: AppConstants.signUp,
        ),
        Tab(
          text: AppConstants.login,
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key, required this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.topRight,
          child: SvgImageComponent(
            path: AssetsManager.plantLogo,
            height: 100,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Transform.rotate(
            angle: 192 * 3.14 / 180,
            child: const SvgImageComponent(
              path: AssetsManager.plantLogo,
              height: 100,
            ),
          ),
        ),
        child!,
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/presentation/layout/blog-screen/view/blog_screen.dart';
import 'package:plant_app/presentation/layout/profile-screen/view/profile_screen.dart';
import 'package:plant_app/presentation/resources/routes_manager.dart';
import 'package:plant_app/presentation/shared/constants/constants.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors.dart';
import '../../resources/values_manager.dart';
import '../../shared/components/sized_box.dart';
import '../../shared/components/svg_img.dart';
import '../scanner-screen/view/scanner_screen.dart';
import '../view_model/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<LayoutCubit>().changeIndex(AppConstants.ZERO);
            },
            child: const SvgImageComponent(
              path: AssetsManager.homeLogo,
            ),
          ),
          body: LayoutCubit.get(context)
              .screens[context.watch<LayoutCubit>().currIndex],
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: AppSizes.s14,
            elevation: AppSizes.s5,
            color: ColorsManager.whiteColor,
            child: IconTheme(
              data:
                  IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.s8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const BlogScreen()));
                      },
                      icon: const SvgImageComponent(
                        path: AssetsManager.leaveLogo,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QRCodeScanner()));
                      },
                      icon: const SvgImageComponent(
                        path: AssetsManager.qrCodeLogo,
                      ),
                    ),
                    getSizedBoxForWidth(width: AppSizes.s66),
                    IconButton(
                      onPressed: () {
                        context
                            .read<LayoutCubit>()
                            .changeIndex(AppConstants.ONE);
                      },
                      icon: const SvgImageComponent(
                        path: AssetsManager.bellLogo,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const ProfileScreen()));
                      },
                      icon: const SvgImageComponent(
                        path: AssetsManager.userLogo,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

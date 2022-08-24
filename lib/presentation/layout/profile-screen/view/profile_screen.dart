import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/presentation/layout/profile-screen/view_model/profile_data.dart';
import 'package:plant_app/presentation/resources/assets_manager.dart';
import 'package:plant_app/presentation/resources/colors.dart';
import 'package:plant_app/presentation/resources/fonts_manager.dart';
import 'package:plant_app/presentation/resources/values_manager.dart';
import 'package:plant_app/presentation/resources/values_manager.dart';
import 'package:plant_app/presentation/shared/components/sized_box.dart';
import 'package:plant_app/presentation/shared/components/svg_img.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';

import '../../../../domain/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user;
    return Scaffold(
      body: FutureBuilder<User>(
          future: ProfileData.getUser(),
          builder: (context, data) {
            if (data.hasData == true) {
              return SafeArea(
                child: Stack(
                  children: [
                    Image.network(
                      "https://i.pinimg.com/564x/42/8e/0c/428e0c990dafc472d69827f66c37d60a.jpg",
                      fit: BoxFit.fitHeight,
                      height: double.infinity,
                    ),
                    Container(
                      color: ColorsManager.black.withOpacity(.80),
                    ),
                    Positioned(
                      top: AppSizes.s26,
                      left: AppSizes.s24,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const SvgImageComponent(
                          path: AssetsManager.arrowBack,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: AppSizes.s26,
                      right: AppSizes.s24,
                      child: SvgImageComponent(
                        path: AssetsManager.more,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          getSizedBoxForHeight(height: 60),
                          CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                NetworkImage(data.data?.imageUrl ?? ""),
                          ),
                          getSizedBoxForHeight(height: AppSizes.s12),
                          TextComponent(
                            textStyle: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 24.88,
                                    color: ColorsManager.whiteColor),
                            text: ("${data.data?.firstName} ") +
                                ("${data.data?.lastName}"),
                          ),
                          getSizedBoxForHeight(height: AppSizes.s26),
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: ColorsManager.whiteColor,
                                  borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(AppSizes.s28),
                                    topEnd: Radius.circular(AppSizes.s28),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(AppSizes.s24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildPoints(context),
                                      getSizedBoxForHeight(
                                          height: AppSizes.s18),
                                      TextComponent(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: ColorsManager.black,
                                                fontSize: 19.88,
                                                fontWeight: FontsWeightManager
                                                    .$RobotoMed,
                                              ),
                                          text: "Edit Profile"),
                                      getSizedBoxForHeight(
                                          height: AppSizes.s18),
                                      Card(
                                        elevation: AppSizes.s0,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: ColorsManager
                                                    .firstGreyColor
                                                    .withOpacity(.5),
                                                width: 1.2),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(AppSizes.s10),
                                            )),
                                        color: ColorsManager.whiteColor,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: AppSizes.s12,
                                              vertical: AppSizes.s16),
                                          child: Row(
                                            children: [
                                              const SvgImageComponent(
                                                  path: AssetsManager.change),
                                              getSizedBoxForWidth(
                                                  width: AppSizes.s10),
                                              TextComponent(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        color:
                                                            ColorsManager.black,
                                                        fontSize: 15.88,
                                                        fontWeight:
                                                            FontsWeightManager
                                                                .$RobotoMed,
                                                      ),
                                                  text: "Change Name"),
                                              const Spacer(),
                                              const SvgImageComponent(
                                                  path:
                                                      AssetsManager.arrowFront),
                                            ],
                                          ),
                                        ),
                                      ),
                                      getSizedBoxForHeight(
                                          height: AppSizes.s12),
                                      Card(
                                        elevation: AppSizes.s0,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: ColorsManager
                                                    .firstGreyColor
                                                    .withOpacity(.5),
                                                width: 1.2),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(AppSizes.s10),
                                            )),
                                        color: ColorsManager.whiteColor,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: AppSizes.s12,
                                              vertical: AppSizes.s16),
                                          child: Row(
                                            children: [
                                              const SvgImageComponent(
                                                  path: AssetsManager.change),
                                              getSizedBoxForWidth(
                                                  width: AppSizes.s10),
                                              TextComponent(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        color:
                                                            ColorsManager.black,
                                                        fontSize: 15.88,
                                                        fontWeight:
                                                            FontsWeightManager
                                                                .$RobotoMed,
                                                      ),
                                                  text: "Change Email"),
                                              const Spacer(),
                                              const SvgImageComponent(
                                                  path:
                                                      AssetsManager.arrowFront),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              );
            }
          }),
    );
  }

  Card _buildPoints(BuildContext context) {
    return Card(
      elevation: AppSizes.s0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(AppSizes.s10),
      )),
      color: ColorsManager.greenLightColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s10, vertical: AppSizes.s16),
        child: Row(
          children: [
            const SvgImageComponent(path: AssetsManager.stars),
            getSizedBoxForWidth(width: AppSizes.s10),
            TextComponent(
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorsManager.black,
                      fontSize: 15.88,
                      fontWeight: FontsWeightManager.$RobotoMed,
                    ),
                text: "You have 30 points")
          ],
        ),
      ),
    );
  }
}

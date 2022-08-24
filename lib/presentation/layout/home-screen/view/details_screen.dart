import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/domain/plants_model.dart';
import 'package:plant_app/presentation/resources/colors.dart';
import 'package:plant_app/presentation/resources/fonts_manager.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';
import 'package:plant_app/presentation/shared/constants/constants.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../shared/components/sized_box.dart';
import '../../../shared/components/svg_img.dart';

class DetailsScreen extends StatelessWidget {
  final String tag;
  final dynamic data;

  const DetailsScreen({Key? key, required this.tag, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: tag,
          child: Stack(
            children: [
              Image(
                fit: BoxFit.fitHeight,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) => const Image(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      "https://www.bigpharmacy.com.my/scripts/timthumb.php?src=https://www.bigpharmacy.com.my//site_media/img/4101d83b54c7b8d58639aba6fa6622e6.jpg&w=70&zc=1"),
                ),
                image: NetworkImage(
                  data.imageUrl,
                ),
              ),
              Container(
                color: ColorsManager.black.withOpacity(.6),
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
                    if (data is PlantsData)
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          child: Column(
                            children: [
                              getSizedBoxForHeight(height: AppSizes.s18),
                              Row(
                                children: [
                                  buildNaturalDetails(AssetsManager.sun),
                                  getSizedBoxForWidth(width: AppSizes.s18),
                                  _buildNaturalDetailsNumberForSun(
                                      context, data.sunLight),
                                ],
                              ),
                              getSizedBoxForHeight(height: AppSizes.s22),
                              Row(
                                children: [
                                  buildNaturalDetails(AssetsManager.water),
                                  getSizedBoxForWidth(width: AppSizes.s18),
                                  _buildNaturalDetailsNumberForWater(
                                      context, data.waterCapacity),
                                ],
                              ),
                              getSizedBoxForHeight(height: AppSizes.s22),
                              Row(
                                children: [
                                  buildNaturalDetails(
                                      AssetsManager.thermometer),
                                  getSizedBoxForWidth(width: AppSizes.s18),
                                  _buildNaturalDetailsNumberForTemp(
                                      context, data.temperature),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ConditionalBuilder(
                      condition: data is! PlantsData,
                      builder: (context) => Column(
                        children: [
                          getSizedBoxForHeight(height: 20),
                          Center(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(80)),
                              child: Image(
                                height: AppSizes.$150,
                                width: AppSizes.$150,
                                fit: BoxFit.cover,
                                image: NetworkImage(data.imageUrl),
                                errorBuilder: (context, error, stackTrace) =>
                                    const Image(
                                  height: AppSizes.$150,
                                  width: AppSizes.$150,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://www.bigpharmacy.com.my/scripts/timthumb.php?src=https://www.bigpharmacy.com.my//site_media/img/4101d83b54c7b8d58639aba6fa6622e6.jpg&w=70&zc=1"),
                                ),
                              ),
                            ),
                          ),
                          getSizedBoxForHeight(height: AppSizes.$100),
                        ],
                      ),
                      fallback: (context) => Container(),
                    ),
                    Flexible(
                      flex: data is PlantsData ? 3 : 1,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.s35,
                                vertical: AppSizes.s24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextComponent(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: ColorsManager.black,
                                          fontSize: AppSizes.s20,
                                          fontWeight:
                                              FontsWeightManager.$RobotoBold),
                                  text: data.name,
                                ),
                                getSizedBoxForHeight(height: AppSizes.s2),
                                TextComponent(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: ColorsManager.thirdGreyColor,
                                          fontSize: AppSizes.s14,
                                          fontWeight: FontsWeightManager
                                              .$RobotoRegular),
                                  text: data.description,
                                ),
                                getSizedBoxForHeight(height: AppSizes.s10),
                                TextComponent(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: ColorsManager.thirdGreyColor,
                                          fontSize: AppSizes.s14,
                                          fontWeight: FontsWeightManager
                                              .$RobotoRegular),
                                  text: AppConstants.$Lorem,
                                ),
                                getSizedBoxForHeight(height: AppSizes.s10),
                                TextComponent(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: ColorsManager.thirdGreyColor,
                                          fontSize: AppSizes.s14,
                                          fontWeight: FontsWeightManager
                                              .$RobotoRegular),
                                  text: AppConstants.$Lorem,
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
        ),
      ),
    );
  }

  Column _buildNaturalDetailsNumberForSun(BuildContext context, int sunLight) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextComponent(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppSizes.s22,
                      fontWeight: FontsWeightManager.$RobotoBold,
                      color: ColorsManager.whiteColor),
                  text: "$sunLight"),
              Column(
                children: [
                  TextComponent(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: AppSizes.s16,
                              fontWeight: FontsWeightManager.$RobotoRegular,
                              color: ColorsManager.whiteColor),
                      text: "%"),
                  getSizedBoxForHeight(height: 20)
                ],
              ),
            ],
          ),
          getSizedBoxForHeight(height: AppSizes.s4),
          TextComponent(
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppSizes.s14,
                  fontWeight: FontsWeightManager.$RobotoRegular,
                  color: ColorsManager.whiteColor),
              text: "Sun Light"),
        ],
      );

  Column _buildNaturalDetailsNumberForWater(
          BuildContext context, int waterCapacity) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextComponent(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppSizes.s22,
                      fontWeight: FontsWeightManager.$RobotoBold,
                      color: ColorsManager.whiteColor),
                  text: "$waterCapacity"),
              Column(
                children: [
                  TextComponent(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: AppSizes.s16,
                              fontWeight: FontsWeightManager.$RobotoRegular,
                              color: ColorsManager.whiteColor),
                      text: "%"),
                  getSizedBoxForHeight(height: 20)
                ],
              ),
            ],
          ),
          getSizedBoxForHeight(height: AppSizes.s4),
          TextComponent(
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppSizes.s14,
                  fontWeight: FontsWeightManager.$RobotoRegular,
                  color: ColorsManager.whiteColor),
              text: "Water Capacity"),
        ],
      );

  Column _buildNaturalDetailsNumberForTemp(BuildContext context, int temp) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextComponent(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppSizes.s22,
                      fontWeight: FontsWeightManager.$RobotoBold,
                      color: ColorsManager.whiteColor),
                  text: "$temp"),
              Column(
                children: [
                  Container(
                    height: AppSizes.s8,
                    width: AppSizes.s8,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: ColorsManager.whiteColor,
                          width: AppSizes.s1_5),
                      shape: BoxShape.circle,
                    ),
                  ),
                  getSizedBoxForHeight(height: 20)
                ],
              ),
              getSizedBoxForWidth(width: AppSizes.s4),
              TextComponent(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppSizes.s16,
                      fontWeight: FontsWeightManager.$RobotoRegular,
                      color: ColorsManager.whiteColor),
                  text: "c"),
            ],
          ),
          getSizedBoxForHeight(height: AppSizes.s4),
          TextComponent(
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppSizes.s14,
                  fontWeight: FontsWeightManager.$RobotoRegular,
                  color: ColorsManager.whiteColor),
              text: "Temperature"),
        ],
      );

  Container buildNaturalDetails(String img) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.black.withOpacity(.4),
          borderRadius:
              const BorderRadiusDirectional.all(Radius.circular(AppSizes.s10))),
      width: AppSizes.s68,
      height: AppSizes.s68,
      child: Image(
        image: AssetImage(img),
      ),
    );
  }
}

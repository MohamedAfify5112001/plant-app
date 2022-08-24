import 'package:flutter/material.dart';
import 'package:plant_app/presentation/shared/components/sized_box.dart';
import 'package:plant_app/presentation/shared/components/svg_img.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors.dart';
import '../../resources/values_manager.dart';
import '../strings/strings_manager.dart';

Widget buildSearch(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16, vertical: AppPadding.p14),
    decoration: const BoxDecoration(
      color: ColorsManager.lightGreyColor,
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(AppSizes.s10),
      ),
    ),
    child: Row(
      children: [
        const SvgImageComponent(
          path: AssetsManager.searchLogo,
          width: AppSizes.s20,
        ),
        getSizedBoxForWidth(width: AppSizes.s16),
        TextComponent(
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppSizes.s16,
                color: ColorsManager.thirdGreyColor,
              ),
          text: StringsManager.search,
        )
      ],
    ),
  );
}

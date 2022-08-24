import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/domain/notification_item.dart';
import 'package:plant_app/presentation/resources/colors.dart';
import 'package:plant_app/presentation/resources/fonts_manager.dart';
import 'package:plant_app/presentation/resources/values_manager.dart';
import 'package:plant_app/presentation/shared/components/sized_box.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.s16),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: TextComponent(
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(
                            fontSize: AppSizes.s19,
                            color: ColorsManager.black,
                            fontWeight: FontsWeightManager.$RobotoMed),
                    text: "Notification",
                  ),
                ),
                getSizedBoxForHeight(height: AppSizes.s22),
                ExpansionPanelList(
                  elevation: AppSizes.s0,
                  expansionCallback: (index, isExpanded) {
                    setState(() {
                      items[index].isExpanded = !isExpanded;
                    });
                  },
                  children: items
                      .map((item) => _buildExpansionPanelNotification(item))
                      .toList(),
                ),
              ],
            )),
      ),
    );
  }

  ExpansionPanel _buildExpansionPanelNotification(
          NotificationItem notificationItem) =>
      ExpansionPanel(
        isExpanded: notificationItem.isExpanded,
        canTapOnHeader: true,
        headerBuilder: (context, isExpanded) {
          return Padding(
            padding: const EdgeInsets.only(
                left: AppSizes.s14, top: AppSizes.s12, bottom: AppSizes.s12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: AppSizes.s22,
                  backgroundImage: NetworkImage(notificationItem.photo),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: AppSizes.s14,
                              color: ColorsManager.black,
                              fontWeight: FontsWeightManager.$RobotoMed),
                      text: notificationItem.header,
                    ),
                    getSizedBoxForHeight(height: AppSizes.s4),
                    TextComponent(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: AppSizes.s14,
                              color: ColorsManager.thirdGreyColor,
                              fontWeight: FontsWeightManager.$RobotoRegular),
                      text: notificationItem.time,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                height: 80,
                width: 4,
                decoration: const BoxDecoration(
                  color: ColorsManager.thirdLightGreyColor,
                  borderRadius: BorderRadius.all(Radius.circular(AppSizes.s2))
                ),
              ),
            ),
            getSizedBoxForWidth(width: AppSizes.s8),
            Expanded(
              flex: 3,
              child: TextComponent(
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: AppSizes.s14,
                    color: ColorsManager.black,
                    fontWeight: FontsWeightManager.$RobotoMed),
                text: notificationItem.body,
              ),
            ),
          ],
        ),
      );
}

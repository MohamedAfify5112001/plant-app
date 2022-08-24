import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/presentation/Layout/home-screen/view_model/home_cubit.dart';
import 'package:plant_app/presentation/forums/view/forums_screen.dart';
import 'package:plant_app/presentation/layout/home-screen/view/details_screen.dart';
import 'package:plant_app/presentation/questions/view/quiz_screen.dart';
import 'package:plant_app/presentation/resources/colors.dart';
import 'package:plant_app/presentation/shared/components/sized_box.dart';
import 'package:plant_app/presentation/shared/components/svg_img.dart';
import 'package:plant_app/presentation/shared/constants/constants.dart';
import 'package:plant_app/presentation/shared/strings/strings_manager.dart';

import '../../../../domain/plants_model.dart';
import '../../../../domain/seeds_model.dart';
import '../../../../domain/tools_model.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/fonts_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../shared/components/elevated_buttom.dart';
import '../../../shared/components/image_comp.dart';
import '../../../shared/components/search.dart';
import '../../../shared/components/text_comp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PlantsData> plants = [];
  List<Seed> seeds = [];
  List<Tool> tools = [];
  late List all;
  late List<Widget> items = [
    _buildAll(context),
    _buildPlants(context),
    _buildSeeds(context),
    _buildTools(context),
  ];

  @override
  void initState() {
    context.read<HomeCubit>().getPlants();
    context.read<HomeCubit>().getSeeds();
    context.read<HomeCubit>().getTools();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetPlantsSuccessState) {
          plants = state.plants;
        }
        if (state is GetSeedsSuccessState) {
          seeds = state.seeds;
        }
        if (state is GetToolsSuccessState) {
          tools = state.tools;
        }
      },
      builder: (context, state) {
        all = [...plants, ...seeds, ...tools];
        all.shuffle();
        return ConditionalBuilder(
          condition: plants.isNotEmpty && seeds.isNotEmpty && all.isNotEmpty,
          builder: (context) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p25, vertical: AppPadding.p28),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(
                          flex: 4,
                        ),
                        const AssetImageComponent(
                          path: AssetsManager.splashLogo,
                          width: AppSizes.$200,
                          height: AppSizes.s35,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForumsScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: AppSizes.s30,
                            width: AppSizes.s30,
                            decoration: const BoxDecoration(
                                color: ColorsManager.primaryColor,
                                shape: BoxShape.circle),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Image(
                                  image: AssetImage(AssetsManager.global),
                                ),
                              ),
                            ),
                          ),
                        ),
                        getSizedBoxForWidth(width: AppSizes.s8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const QuizScreen()));
                          },
                          child: Container(
                            height: AppSizes.s30,
                            width: AppSizes.s30,
                            decoration: const BoxDecoration(
                                color: ColorsManager.primaryColor,
                                shape: BoxShape.circle),
                            child: Center(
                              child: TextComponent(
                                text: "?",
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontWeight:
                                            FontsWeightManager.$RobotoBold,
                                        fontSize: AppSizes.s18,
                                        color: ColorsManager.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    getSizedBoxForHeight(height: AppSizes.s30),
                    Row(
                      children: [
                        Expanded(child: buildSearch(context)),
                        getSizedBoxForWidth(width: AppSizes.s10),
                        _buildCartItem(),
                      ],
                    ),
                    getSizedBoxForHeight(height: AppSizes.s37),
                    _buildAllItemsChips(),
                    getSizedBoxForHeight(height: AppSizes.s55),
                    SizedBox(
                      child: Column(
                        children: [
                          items[context.watch<HomeCubit>().currIndex],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.primaryColor,
            ),
          ),
        );
      },
    );
  }

  GridView _buildSeeds(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisSpacing: 5,
      mainAxisSpacing: AppSizes.s24,
      crossAxisCount: 2,
      childAspectRatio: 400 / 555,
      children: List.generate(
          seeds.length, (index) => _buildItem(context, seeds[index])),
    );
  }

  GridView _buildAll(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisSpacing: 5,
      mainAxisSpacing: AppSizes.s24,
      crossAxisCount: 2,
      childAspectRatio: 400 / 555,
      children: List.generate(
        all.length,
        (index) => _buildItem(context, all[index]),
      ),
    );
  }

  GridView _buildPlants(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisSpacing: 5,
      mainAxisSpacing: AppSizes.s24,
      crossAxisCount: 2,
      childAspectRatio: 400 / 555,
      children: List.generate(
        plants.length,
        (index) => _buildItem(context, plants[index]),
      ),
    );
  }

  GridView _buildTools(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisSpacing: 5,
      mainAxisSpacing: AppSizes.s24,
      crossAxisCount: 2,
      childAspectRatio: 400 / 555,
      children: List.generate(
          tools.length, (index) => _buildItem(context, tools[index])),
    );
  }

  Stack _buildItem(BuildContext context, dynamic data) {
    return Stack(
      children: [
        Card(
          elevation: AppSizes.s1,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSizedBoxForWidth(width: AppSizes.s5),
                _buildCounter(context),
                getSizedBoxForHeight(height: AppSizes.s95),
                TextComponent(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorsManager.black,
                        fontSize: AppSizes.s14,
                        fontWeight: FontsWeightManager.$RobotoBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                  text: data.name ?? "",
                ),
                getSizedBoxForHeight(height: AppSizes.s4),
                TextComponent(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorsManager.black,
                              fontSize: AppSizes.s12,
                              fontWeight: FontsWeightManager.$RobotoBold,
                            ),
                    text: "70 EGP"),
                getSizedBoxForHeight(height: AppSizes.s12),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButtonShared(
                    text: AppConstants.cart,
                    onPressed: () {},
                    radius: AppSizes.s10,
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: AppSizes.s16,
                              fontWeight: FontsWeightManager.$RobotoBold,
                              color: ColorsManager.whiteColor,
                            ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  tag: data.imageUrl ?? "",
                  data: data,
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: NetworkImage(data.imageUrl ??
                  "https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image@2x.png"),
              fit: BoxFit.cover,
              height: AppSizes.s95,
              width: AppSizes.s95,
              errorBuilder: (context, error, stackTrace) => const Image(
                height: AppSizes.s95,
                width: AppSizes.s95,
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image@2x.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildCounter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            context.read<HomeCubit>().decrement();
          },
          child: const Icon(
            Icons.remove,
            color: ColorsManager.thirdGreyColor,
            size: AppSizes.s20,
          ),
        ),
        getSizedBoxForWidth(width: AppSizes.s8),
        TextComponent(
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppSizes.s16,
                fontWeight: FontsWeightManager.$RobotoBold,
                color: ColorsManager.black,
              ),
          text: context.watch<HomeCubit>().initCount.toString(),
        ),
        getSizedBoxForWidth(width: AppSizes.s8),
        GestureDetector(
          onTap: () {
            context.read<HomeCubit>().increment();
          },
          child: const Icon(
            Icons.add,
            color: ColorsManager.thirdGreyColor,
            size: AppSizes.s20,
          ),
        )
      ],
    );
  }

  SizedBox _buildAllItemsChips() {
    return SizedBox(
      height: AppSizes.s45,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().changeIndex(index);
                },
                child: _buildChipCategory(
                    context,
                    AppConstants.chipsTitle[index],
                    context.watch<HomeCubit>().currIndex,
                    index),
              ),
          separatorBuilder: (context, index) =>
              getSizedBoxForWidth(width: AppSizes.s20),
          itemCount: 4),
    );
  }

  Widget _buildCartItem() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p14, vertical: AppPadding.p12),
      decoration: const BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(AppSizes.s10),
        ),
      ),
      child: const SvgImageComponent(
        path: AssetsManager.cartLogo,
      ),
    );
  }

  Widget _buildChipCategory(
      BuildContext context, String title, int curr, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: (curr == index) ? AppSizes.s75 : AppSizes.$110,
        decoration: BoxDecoration(
          color: (curr == index)
              ? ColorsManager.whiteColor
              : ColorsManager.lightGreyColor,
          borderRadius: const BorderRadiusDirectional.all(
            Radius.circular(AppSizes.s10),
          ),
          border: Border.all(
              width: (curr == index) ? AppSizes.s2 : AppSizes.s0,
              color: (curr == index)
                  ? ColorsManager.primaryColor
                  : ColorsManager.lightGreyColor),
        ),
        child: Center(
          child: TextComponent(
            text: title,
            textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: (curr == index)
                    ? ColorsManager.primaryColor
                    : ColorsManager.thirdGreyColor,
                fontSize: AppSizes.s16),
          ),
        ),
      ),
    );
  }
}

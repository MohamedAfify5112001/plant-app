import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/presentation/layout/blog-screen/view_model/blog_cubit.dart';
import 'package:plant_app/presentation/resources/assets_manager.dart';
import 'package:plant_app/presentation/resources/colors.dart';
import 'package:plant_app/presentation/resources/fonts_manager.dart';
import 'package:plant_app/presentation/resources/values_manager.dart';
import 'package:plant_app/presentation/shared/components/sized_box.dart';
import 'package:plant_app/presentation/shared/components/svg_img.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';

import '../../../../domain/plants_model.dart';
import '../../../../domain/seeds_model.dart';
import '../../../../domain/tools_model.dart';
import '../../home-screen/view/details_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<PlantsData> plants = [];
  List<Seed> seeds = [];
  List<Tool> tools = [];

  @override
  void initState() {
    context.read<BlogCubit>().getBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogCubit, BlogState>(
      listener: (context, state) {
        if (state is GetPlantsBlogSuccessState) {
          plants = state.blog.plants ?? [];
          seeds = state.blog.seeds ?? [];
          tools = state.blog.tools ?? [];
        }
      },
      builder: (context, state) {
        List all = [...plants, ...seeds, ...tools];
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  getSizedBoxForWidth(width: AppSizes.s18),
                  const SvgImageComponent(
                      path: AssetsManager.arrowBackBlack, width: 30),
                ],
              ),
            ),
            centerTitle: true,
            title: TextComponent(
              text: "Blogs",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontsWeightManager.$RobotoBold,
                  fontSize: AppSizes.s20,
                  color: ColorsManager.black),
            ),
          ),
          body: ConditionalBuilder(
            condition: state is GetPlantsBlogSuccessState,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(AppSizes.s16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => _buildBlog(all[index]),
                  separatorBuilder: (context, index) =>
                      getSizedBoxForHeight(height: AppSizes.s10),
                  itemCount: all.length,
                ),
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildBlog(dynamic data) {
    return Column(
      children: [
        Card(
          elevation: AppSizes.s1,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.s10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSizes.s10)),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            tag: data.imageUrl ?? "",
                            data: data,
                          ),
                        ),
                      );
                    },
                    child: Image(
                      errorBuilder: (context, error, stackTrace) => const Image(
                        height: AppSizes.$150,
                        width: AppSizes.$150,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://www.bigpharmacy.com.my/scripts/timthumb.php?src=https://www.bigpharmacy.com.my//site_media/img/4101d83b54c7b8d58639aba6fa6622e6.jpg&w=70&zc=1"),
                      ),
                      height: AppSizes.$150,
                      width: AppSizes.$150,
                      fit: BoxFit.cover,
                      image: NetworkImage(data.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSizes.s8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextComponent(
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: AppSizes.s14),
                          text: "2 days ago",
                        ),
                        getSizedBoxForHeight(height: AppSizes.s8),
                        TextComponent(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: AppSizes.s17,
                                    fontWeight: FontsWeightManager.$RobotoBold,
                                    color: ColorsManager.black,
                                  ),
                          text: data.name,
                        ),
                        getSizedBoxForHeight(height: AppSizes.s14),
                        TextComponent(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: AppSizes.s12,
                                    color: ColorsManager.thirdGreyColor,
                                  ),
                          text: data.description,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

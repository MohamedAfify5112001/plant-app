import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/presentation/add-post/view/add_post_screen.dart';
import 'package:plant_app/presentation/forums/view_model/forums_cubit.dart';
import 'package:plant_app/presentation/shared/components/search.dart';

import '../../../domain/forum_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../shared/components/sized_box.dart';
import '../../shared/components/svg_img.dart';
import '../../shared/components/text_comp.dart';
import '../../shared/constants/constants.dart';

class ForumsScreen extends StatefulWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  State<ForumsScreen> createState() => _ForumsScreenState();
}

class _ForumsScreenState extends State<ForumsScreen> {
  final List<String> titles = ["All Forums", "My Forums"];

  /* List<Forum> allForums = [];
  List<Forum> myForums = [];*/
  // late List<Widget> items = [_buildPostList(), _buildMyPostList()];
  int currIndex = 0;

  @override
  void initState() {
    /*context.read<ForumsCubit>().getAllForums();
    context.read<ForumsCubit>().getMyForums();*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin:
            const EdgeInsets.only(bottom: AppSizes.s26, right: AppSizes.s13),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddPostScreen()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
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
          text: "Discussion Forums",
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontsWeightManager.$RobotoBold,
              fontSize: AppSizes.s20,
              color: ColorsManager.black),
        ),
      ),
      body: FutureBuilder(
        future: Future.wait(
            [ForumsCubit.getAllForums(), ForumsCubit.getMyForums()]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData == true) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p25, vertical: AppPadding.p28),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSearch(context),
                    getSizedBoxForHeight(height: AppSizes.s10),
                    Row(
                      children: List.generate(
                        titles.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: AppSizes.s10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currIndex = index;
                              });
                            },
                            child: SizedBox(
                              width: AppSizes.$150,
                              child: _buildChips(
                                  context, titles[index], index, currIndex),
                            ),
                          ),
                        ),
                      ),
                    ),
                    getSizedBoxForHeight(height: AppSizes.s16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currIndex == 0)
                          _buildPostList(snapshot.data![0])
                        else
                          _buildMyPostList(snapshot.data![1])
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColor,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildChips(BuildContext context, String title, int index, int curr) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          border: index != curr
              ? Border.all(
                  width: AppSizes.s1, color: ColorsManager.thirdGreyColor)
              : null,
          color: index == curr
              ? ColorsManager.primaryColor
              : ColorsManager.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSizes.s10),
          ),
        ),
        child: Center(
          child: TextComponent(
            text: title,
            textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: index == curr
                      ? ColorsManager.whiteColor
                      : ColorsManager.thirdGreyColor,
                  fontSize: AppSizes.s12,
                  fontWeight: FontsWeightManager.$RobotoMed,
                ),
          ),
        ),
      ),
    );
  }

  ListView _buildPostList(List<dynamic> allForums) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => _buildPost(context, allForums[index]),
      separatorBuilder: (context, index) =>
          getSizedBoxForHeight(height: AppSizes.s14),
      itemCount: allForums.length,
    );
  }

  ListView _buildMyPostList(List<dynamic> myForums) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => _buildPost(context, myForums[index]),
      separatorBuilder: (context, index) =>
          getSizedBoxForHeight(height: AppSizes.s14),
      itemCount: myForums.length,
    );
  }

  Column _buildPost(BuildContext context, Forum forum) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0.3,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.s0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSizes.s12),
                  child: _buildProfileSharePost(forum),
                ),
                getSizedBoxForHeight(height: AppSizes.s22),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSizes.s18),
                  child: _buildCaption(forum),
                ),
                getSizedBoxForHeight(height: AppSizes.s20),
                _buildImagePost(context, forum.imageUrl ?? ""),
                getSizedBoxForHeight(height: AppSizes.s16),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSizes.s12),
                  child: Row(
                    children: [
                      _buildLikes(context, forum),
                      getSizedBoxForWidth(width: AppSizes.s37),
                      _buildComments(context, forum),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCaption(Forum forum) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextComponent(
            text: forum.title ?? "",
            textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorsManager.primaryColor,
                fontWeight: FontsWeightManager.$RobotoBold,
                fontSize: AppSizes.s16),
          ),
          getSizedBoxForHeight(height: AppSizes.s8),
          TextComponent(
            text: forum.description ?? "",
            textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorsManager.firstGreyColor,
                fontWeight: FontsWeightManager.$RobotoRegular,
                fontSize: AppSizes.s10),
          ),
        ],
      );

  Row _buildProfileSharePost(Forum forum) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(80)),
          child: Image(
            height: AppSizes.$150,
            width: AppSizes.$150,
            fit: BoxFit.cover,
            image: NetworkImage(forum.user!.imageUrl ?? ""),
            errorBuilder: (context, error, stackTrace) => const Image(
              height: AppSizes.$150,
              width: AppSizes.$150,
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image@2x.png"),
            ),
          ),
        ),
        getSizedBoxForWidth(width: AppSizes.s8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextComponent(
              text: '${forum.user?.firstName} ${forum.user?.lastName}',
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorsManager.black,
                  fontWeight: FontsWeightManager.$RobotoBold,
                  fontSize: AppSizes.s13),
            ),
            getSizedBoxForHeight(height: AppSizes.s4),
            TextComponent(
              text: "a month ago",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorsManager.firstGreyColor,
                  fontWeight: FontsWeightManager.$RobotoRegular,
                  fontSize: AppSizes.s10),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildImagePost(BuildContext context, String img) {
    return Image(
      image: NetworkImage(AppConstants.BASEURL + img),
      errorBuilder: (context, error, stackTrace) => const Image(
        fit: BoxFit.cover,
        image: NetworkImage(
            "https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image@2x.png"),
      ),
    );
  }

  Widget _buildLikes(BuildContext context, Forum forum) {
    return Row(
      children: [
        const SvgImageComponent(path: AssetsManager.$Like),
        getSizedBoxForWidth(width: AppSizes.s4),
        TextComponent(
          text: "${forum.forumLikes!.length} Likes",
          textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: ColorsManager.thirdGreyColor,
                fontSize: AppSizes.s10,
                fontWeight: FontsWeightManager.$RobotoMed,
              ),
        ),
      ],
    );
  }

  Widget _buildComments(BuildContext context, Forum forum) {
    return TextComponent(
      text: "${forum.forumComments!.length} Comments",
      textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: ColorsManager.thirdGreyColor,
            fontSize: AppSizes.s10,
            fontWeight: FontsWeightManager.$RobotoMed,
          ),
    );
  }
}
/*
*
*  ConditionalBuilder(
            condition: myForums.isNotEmpty && allForums.isNotEmpty,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p25, vertical: AppPadding.p28),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSearch(context),
                    getSizedBoxForHeight(height: AppSizes.s10),
                    Row(
                      children: List.generate(
                        titles.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: AppSizes.s10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currIndex = index;
                              });
                            },
                            child: SizedBox(
                              width: AppSizes.$150,
                              child: _buildChips(
                                  context, titles[index], index, currIndex),
                            ),
                          ),
                        ),
                      ),
                    ),
                    getSizedBoxForHeight(height: AppSizes.s16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        items[currIndex],
                      ],
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColor,
              ),
            ),
          )
* */

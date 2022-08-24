import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/presentation/add-post/view_model/add_post_cubit.dart';
import 'package:plant_app/presentation/shared/components/text_form_field.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../shared/components/elevated_buttom.dart';
import '../../shared/components/sized_box.dart';
import '../../shared/components/snakbar_comp.dart';
import '../../shared/components/svg_img.dart';
import '../../shared/components/text_comp.dart';
import '../../shared/constants/constants.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          snakeBarSharedSuccess(
              msg: "Post is created Successfully", context: context);
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
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
                      path: AssetsManager.arrowBackBlack, width: 25),
                ],
              ),
            ),
            centerTitle: true,
            title: TextComponent(
              text: "Create New Post",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontsWeightManager.$RobotoBold,
                  fontSize: AppSizes.s20,
                  color: ColorsManager.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.s26, vertical: AppSizes.s30),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.read<AddPostCubit>().getImage();
                        },
                        child: Container(
                          height: 136,
                          width: 136,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppSizes.s10)),
                            color: ColorsManager.whiteColor,
                            border: Border.all(
                              color: ColorsManager.primaryColor,
                              width: AppSizes.s1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: ColorsManager.primaryColor,
                              ),
                              getSizedBoxForHeight(height: AppSizes.s14),
                              TextComponent(
                                text: "Add Photo",
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: ColorsManager.primaryColor,
                                        fontWeight:
                                            FontsWeightManager.$RobotoRegular,
                                        fontSize: AppSizes.s16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    getSizedBoxForHeight(height: AppSizes.s22),
                    TextFormFieldComponent(
                      txt: "Title",
                      textEditingController: _titleController,
                      keyboardType: TextInputType.text,
                    ),
                    getSizedBoxForHeight(height: AppSizes.s28),
                    SizedBox(
                      height: 130,
                      child: TextFormFieldComponent(
                        txt: "Description",
                        textEditingController: _descriptionController,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    getSizedBoxForHeight(height: AppSizes.s22),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButtonShared(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AddPostCubit>().createPost(
                                description: _descriptionController.text.trim(),
                                title: _titleController.text.trim());
                          }
                        },
                        text: AppConstants.post,
                        textStyle:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: ColorsManager.whiteColor,
                                  fontSize: AppSizes.s16,
                                  fontWeight: FontsWeightManager.$RobotoMed,
                                ),
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

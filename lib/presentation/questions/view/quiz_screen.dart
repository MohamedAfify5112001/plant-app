import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/domain/quiz_model.dart';
import 'package:plant_app/presentation/questions/view_model/quiz_cubit.dart';
import 'package:plant_app/presentation/shared/components/sized_box.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../shared/components/elevated_buttom.dart';
import '../../shared/components/svg_img.dart';
import '../../shared/components/text_comp.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading:  GestureDetector(
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
              text: "Course Exam",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontsWeightManager.$RobotoBold,
                  fontSize: AppSizes.s20,
                  color: ColorsManager.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppSizes.s10, horizontal: AppSizes.s24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildQuestionsTitleWithNumbers(context),
                getSizedBoxForHeight(height: AppSizes.s26),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final Question question = questions[index];
                      return _buildQuestions(question);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row _buildQuestionsTitleWithNumbers(BuildContext context) {
    return Row(
      children: [
        TextComponent(
          text: "Question",
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontsWeightManager.$RobotoMed,
              fontSize: AppSizes.s35,
              color: ColorsManager.black),
        ),
        getSizedBoxForWidth(width: AppSizes.s8),
        Row(
          children: [
            TextComponent(
              text: "${context.watch<QuizCubit>().questionNumber}",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontsWeightManager.$RobotoMed,
                  fontSize: AppSizes.s35,
                  color: ColorsManager.primaryColor),
            ),
            Column(
              children: [
                getSizedBoxForHeight(height: AppSizes.s16),
                TextComponent(
                  text: "/${questions.length}",
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontsWeightManager.$RobotoRegular,
                      fontSize: AppSizes.s14,
                      color: ColorsManager.thirdGreyColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuestions(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextComponent(
          text: question.text,
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontsWeightManager.$RobotoMed,
              fontSize: AppSizes.s20,
              color: ColorsManager.black),
        ),
        getSizedBoxForHeight(height: AppSizes.s40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: question.options
              .map((option) => Container(
                  margin: const EdgeInsets.only(bottom: AppSizes.s35),
                  child: _buildOption(option)))
              .toList(),
        ),
        getSizedBoxForHeight(height: AppSizes.s45),
        Row(
          children: [
            Expanded(
              child: ConditionalBuilder(
                condition:
                    context.watch<QuizCubit>().questionNumber != AppSizes.s1,
                builder: (context) => OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                          color: ColorsManager.primaryColor,
                          width: AppSizes.s4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppSizes.s10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: AppSizes.$250.toInt()),
                      curve: Curves.easeInExpo,
                    );
                    context.read<QuizCubit>().decrement();
                  },
                  child: TextComponent(
                    text: "Back",
                    textStyle:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorsManager.primaryColor,
                              fontSize: AppSizes.s16,
                              fontWeight: FontsWeightManager.$RobotoMed,
                            ),
                  ),
                ),
                fallback: (context) => Container(),
              ),
            ),
            getSizedBoxForWidth(width: AppSizes.s10),
            Expanded(
              child: ConditionalBuilder(
                condition: context.watch<QuizCubit>().questionNumber !=
                    questions.length,
                builder: (context) => ElevatedButtonShared(
                  radius: AppSizes.s8,
                  text: 'Next',
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: AppSizes.$250.toInt()),
                      curve: Curves.easeInExpo,
                    );
                    context.read<QuizCubit>().increment();
                  },
                  textStyle:
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: ColorsManager.whiteColor,
                            fontSize: AppSizes.s16,
                            fontWeight: FontsWeightManager.$RobotoMed,
                          ),
                ),
                fallback: (context) => Container(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOption(Option option) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: ColorsManager.primaryColor, width: AppSizes.s1_5),
        borderRadius: const BorderRadiusDirectional.all(
          Radius.circular(AppSizes.s10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.s12),
        child: Row(
          children: [
            Expanded(
              child: TextComponent(
                text: option.text,
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontsWeightManager.$RobotoMed,
                    fontSize: AppSizes.s14,
                    color: ColorsManager.black),
              ),
            ),
            Container(
              width: AppSizes.s30,
              height: AppSizes.s30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: AppSizes.s1_5, color: ColorsManager.primaryColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: option.isCorrect
                    ? Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsManager.primaryColor),
                      )
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}

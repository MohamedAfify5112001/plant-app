import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/data/network/dio_helper.dart';
import 'package:plant_app/presentation/layout/view/layout.dart';
import 'package:plant_app/presentation/login-screen/view_model/login_cubit.dart';
import 'package:plant_app/presentation/resources/assets_manager.dart';
import 'package:plant_app/presentation/resources/colors.dart';
import 'package:plant_app/presentation/resources/fonts_manager.dart';
import 'package:plant_app/presentation/resources/routes_manager.dart';
import 'package:plant_app/presentation/resources/values_manager.dart';
import 'package:plant_app/presentation/shared/components/elevated_buttom.dart';
import 'package:plant_app/presentation/shared/components/sized_box.dart';
import 'package:plant_app/presentation/shared/components/svg_img.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';
import 'package:plant_app/presentation/shared/constants/constants.dart';
import 'package:plant_app/presentation/shared/strings/strings_manager.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../../data/request/request.dart';
import '../../shared/components/snakbar_comp.dart';
import '../../shared/components/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textEmailEditingController =
      TextEditingController();
  final TextEditingController _textPasswordEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEmailEditingController.dispose();
    _textPasswordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          snakeBarSharedSuccess(
              msg: state.responseLogin.message, context: context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const LayoutScreen()),
              (route) => false);
        } else if (state is LoginError) {
          snakeBarSharedError(msg: state.responseLogin.msg, context: context);
        }

        if (state is GoogleSignInSuccessState) {
          snakeBarSharedSuccess(
              msg: "Logged In Successfully", context: context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const LayoutScreen()),
              (route) => false);
        } else if (state is LoginError) {
          snakeBarSharedError(msg: state.responseLogin.msg, context: context);
        }
      },
      builder: (context, state) {
        _textEmailEditingController.text = "mohamedafifi89999@gmail.com";
        _textPasswordEditingController.text = "MohamedAfifi2001#\$%%\$%%";
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldComponent(
                keyboardType: TextInputType.emailAddress,
                txt: StringsManager.email,
                textEditingController: _textEmailEditingController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return StringsManager.validName;
                  }
                  return null;
                },
              ),
              getSizedBoxForHeight(height: AppSizes.s28),
              TextFormFieldComponent(
                keyboardType: TextInputType.visiblePassword,
                isSecure: true,
                txt: StringsManager.password,
                textEditingController: _textPasswordEditingController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return StringsManager.validPassword;
                  }
                  return null;
                },
              ),
              getSizedBoxForHeight(height: AppSizes.s28),
              ConditionalBuilder(
                condition: state is! LoginLoading,
                builder: (context) => SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButtonShared(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final LoginRequest request = LoginRequest(
                            email: _textEmailEditingController.text.trim(),
                            password:
                                _textPasswordEditingController.text.trim());
                        context.read<LoginCubit>().signIn(request);
                      }
                    },
                    text: AppConstants.login,
                    textStyle:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorsManager.whiteColor,
                              fontSize: AppSizes.s16,
                              fontWeight: FontsWeightManager.$RobotoMed,
                            ),
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(
                      color: ColorsManager.primaryColor),
                ),
              ),
              getSizedBoxForHeight(height: AppSizes.s28),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: AppSizes.s1,
                      color: ColorsManager.thirdGreyColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: AppSizes.s4),
                    child: TextComponent(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 12.0,
                                color: ColorsManager.thirdGreyColor,
                              ),
                      text: "or continue with",
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: AppSizes.s1,
                      color: ColorsManager.thirdGreyColor,
                    ),
                  )
                ],
              ),
              getSizedBoxForHeight(height: AppSizes.s28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<LoginCubit>().googleLogin();
                    },
                    child: const SvgImageComponent(
                      path: AssetsManager.googleLogo,
                    ),
                  ),
                  getSizedBoxForWidth(width: AppSizes.s35),
                  GestureDetector(
                    onTap: () {},
                    child: const SvgImageComponent(
                      path: AssetsManager.facebookLogo,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

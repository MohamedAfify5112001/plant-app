import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/data/request/request.dart';
import 'package:plant_app/presentation/register-screen/view_model/register_cubit.dart';
import 'package:plant_app/presentation/shared/components/snakbar_comp.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../../shared/components/elevated_buttom.dart';
import '../../shared/components/sized_box.dart';
import '../../shared/components/svg_img.dart';
import '../../shared/components/text_form_field.dart';
import '../../shared/constants/constants.dart';
import '../../shared/strings/strings_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _textFirstNameEditingController =
      TextEditingController();
  final TextEditingController _textLastNameEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEmailEditingController =
      TextEditingController();
  final TextEditingController _textPasswordEditingController =
      TextEditingController();

  @override
  void dispose() {
    _textEmailEditingController.dispose();
    _textFirstNameEditingController.dispose();
    _textLastNameEditingController.dispose();
    _textPasswordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          snakeBarSharedSuccess(
              msg: state.responseRegister.message, context: context);
          Navigator.of(context)
              .pushReplacementNamed(AppRoutes.$LayoutScreenRoute);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldComponent(
                keyboardType: TextInputType.name,
                txt: StringsManager.fName,
                textEditingController: _textFirstNameEditingController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return StringsManager.validFName;
                  }
                  return null;
                },
              ),
              getSizedBoxForHeight(height: AppSizes.s28),
              TextFormFieldComponent(
                keyboardType: TextInputType.name,
                txt: StringsManager.lName,
                textEditingController: _textLastNameEditingController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return StringsManager.validLName;
                  }
                  return null;
                },
              ),
              getSizedBoxForHeight(height: AppSizes.s28),
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
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButtonShared(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final RegisterRequest request = RegisterRequest(
                          firstName: _textFirstNameEditingController.text.trim(),
                          lastName: _textLastNameEditingController.text.trim(),
                          email: _textEmailEditingController.text.trim(),
                          password: _textPasswordEditingController.text.trim());
                      context.read<RegisterCubit>().signup(request);
                    }
                  },
                  text: AppConstants.register,
                  textStyle:
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: ColorsManager.whiteColor,
                            fontSize: AppSizes.s16,
                            fontWeight: FontsWeightManager.$RobotoMed,
                          ),
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
                    onTap: () {},
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

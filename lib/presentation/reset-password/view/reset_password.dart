import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../shared/components/elevated_buttom.dart';
import '../../shared/components/sized_box.dart';
import '../../shared/components/text_comp.dart';
import '../../shared/components/text_form_field.dart';
import '../../shared/constants/constants.dart';
import '../../shared/strings/strings_manager.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _textPasswordEditingController =
      TextEditingController();
  final TextEditingController _textConfirmPasswordEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textPasswordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextComponent(
          text: "New Password",
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontsWeightManager.$RobotoBold,
                fontSize: AppSizes.s20,
                color: ColorsManager.black,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.s18),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormFieldComponent(
                  keyboardType: TextInputType.visiblePassword,
                  isSecure: true,
                  textEditingController: _textPasswordEditingController,
                  txt: 'Enter Password',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return StringsManager.validPassword;
                    }
                    return null;
                  },
                ),
                getSizedBoxForHeight(height: AppSizes.s18),
                TextFormFieldComponent(
                  keyboardType: TextInputType.visiblePassword,
                  isSecure: true,
                  textEditingController: _textConfirmPasswordEditingController,
                  txt: 'Confirm Password',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return StringsManager.validPassword;
                    }
                    return null;
                  },
                ),
                getSizedBoxForHeight(height: AppSizes.s24),
                SizedBox(
                  width: AppSizes.$300,
                  height: 45,
                  child: ElevatedButtonShared(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    text: AppConstants.submit,
                    textStyle:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorsManager.whiteColor,
                              fontSize: AppSizes.s18,
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
  }
}

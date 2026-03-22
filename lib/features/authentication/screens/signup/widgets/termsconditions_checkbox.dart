import 'package:e_commerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Obx(
          () => SizedBox(
            height: 24,
            width: 24,
            child: Checkbox(
              value: SignupController.instance.checkBox.value,
              onChanged: (value) =>
                  SignupController.instance.checkBox.value = value!,
              fillColor: SignupController.instance.checkBox.value
                  ? WidgetStatePropertyAll(AppColors.primary)
                  : null,
              side: SignupController.instance.checkBox.value
                  ? BorderSide.none
                  : BorderSide(color: dark ? AppColors.white : AppColors.dark),
              checkColor: AppColors.white,
            ),
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${AppTexts.iAgreeTo} ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: "${AppTexts.privacyPolicy} ",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: dark ? AppColors.white : AppColors.primary,
                  ),
                ),
                TextSpan(
                  text: "${AppTexts.and} ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: "${AppTexts.termsOfUse} ",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: dark ? AppColors.white : AppColors.primary,
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

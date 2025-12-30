import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
            fillColor: WidgetStatePropertyAll(AppColors.primary),
            checkColor: AppColors.white,
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Text.rich(
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
      ],
    );
  }
}

import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.showActionButton = true,
    this.buttonTitle = "View All",
    this.textColor,
    required this.title,
    this.onPressed,
  });

  final String title, buttonTitle;
  final Color? textColor;
  final bool? showActionButton;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
            color: textColor != null
                ? textColor!
                : darkMode
                ? AppColors.white
                : AppColors.dark,
          ),
        ),
        if (showActionButton!)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: Theme.of(context).textTheme.labelLarge!.apply(
                color: textColor != null
                    ? textColor!
                    : darkMode
                    ? AppColors.white
                    : AppColors.dark,
              ),
            ),
          ),
      ],
    );
  }
}

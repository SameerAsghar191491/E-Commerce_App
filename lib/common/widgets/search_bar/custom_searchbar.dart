import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackGround = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSizes.defaultSpace,
    ),
  });

  final String text;
  final IconData icon;
  final bool showBackGround, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: showBackGround
              ? darkMode
                    ? AppColors.dark
                    : AppColors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
          border: showBorder ? Border.all(color: AppColors.grey) : null,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.spaceBtwItems),
              child: Icon(
                icon,
                color: darkMode ? AppColors.darkerGrey : AppColors.darkGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.spaceBtwItems),
              child: Text(text, style: Theme.of(context).textTheme.bodySmall!),
            ),
          ],
        ),
      ),
    );
  }
}

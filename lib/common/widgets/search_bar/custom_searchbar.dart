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
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: showBackground
              ? darkMode
                    ? AppColors.dark
                    : AppColors.white
              : Colors.transparent,
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
        ),
        child: Row(
          children: [
            const SizedBox(width: AppSizes.md),
            Icon(
              icon,
              color: darkMode ? AppColors.white : AppColors.darkerGrey,
            ),
            const SizedBox(width: AppSizes.md),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: darkMode ? AppColors.white : AppColors.darkerGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

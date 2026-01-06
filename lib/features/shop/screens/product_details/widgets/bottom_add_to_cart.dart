import 'package:e_commerce_app/common/icons/circular_icon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkerGrey : AppColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                color: AppColors.white,
                backgroundColor: AppColors.darkGrey,
                onPressed: () {},
                height: 40,
                width: 40,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: AppSizes.spaceBtwItems),
              CircularIcon(
                icon: Iconsax.add,
                color: AppColors.white,
                backgroundColor: AppColors.dark,
                onPressed: () {},
                height: 40,
                width: 40,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(AppSizes.md),
              backgroundColor: AppColors.black,
              side: BorderSide(color: AppColors.black),
            ),
            onPressed: () {},
            child: Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}

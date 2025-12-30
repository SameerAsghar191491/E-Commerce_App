import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({super.key, this.onPressed, this.iconColor});

  final VoidCallback? onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag),
          color: darkMode ? AppColors.white : AppColors.dark,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: darkMode ? AppColors.white : AppColors.dark,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: darkMode ? AppColors.dark : AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

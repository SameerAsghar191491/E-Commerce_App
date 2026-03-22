import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    required this.height,
    required this.width,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey.shade800 : Colors.grey.shade300,
      highlightColor: dark ? Colors.grey.shade700 : Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color:
              color ??
              (dark
                  ? AppColors.darkerGrey
                  : AppColors.white.withValues(alpha: 0.9)),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

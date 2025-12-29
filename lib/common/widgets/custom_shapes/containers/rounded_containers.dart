import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainers extends StatelessWidget {
  const RoundedContainers({
    super.key,
    this.height,
    this.width,
    this.backgroundColor = AppColors.primary,
    this.child,
    this.padding,
    this.margin,
    this.radius = AppSizes.cardRadiusLg,
    this.showBorder = false,
    this.borderColor = AppColors.primary,
  });

  final double? height;
  final double? width;
  final double radius;
  final Widget? child;
  final Color backgroundColor, borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}

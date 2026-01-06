import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LogoTextVerifiedIcon extends StatelessWidget {
  const LogoTextVerifiedIcon({
    required this.text,
    required this.image,
    this.height = 32,
    this.width = 32,
    this.backgroundColor,
    super.key,
  });

  final String text;
  final String image;
  final double height;
  final double width;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        CircularImage(
          image: image,
          height: height,
          width: width,
          overlayColor: darkMode ? AppColors.white : AppColors.black,
          backgroundColor: darkMode ? AppColors.dark : AppColors.white,
        ),
        BrandTitleWithVerifiedIcon(
          title: text,
          brandTextSize: TextSizes.medium,
        ),
      ],
    );
  }
}

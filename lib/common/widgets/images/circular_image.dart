import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/shimmer_effect/shimmer_effect.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = AppSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        /// if image background color is null, then switch it to light & dark mode color design
        color:
            backgroundColor ??
            (HelperFunctions.isDarkMode(context)
                ? AppColors.black
                : AppColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: isNetworkImage
          ? CachedNetworkImage(
              fit: fit,
              color: overlayColor,
              imageUrl: image,
              errorWidget: (context, url, error) => Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) =>
                  ShimmerEffect(height: height, width: width),
            )
          : Image(fit: fit, image: AssetImage(image) as ImageProvider, color: overlayColor,),
    );
  }
}

import 'package:e_commerce_app/common/icons/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return CurvedEdgesWidget(
      child: Container(
        color: darkMode ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            // -- Product Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(AppImages.productImage5)),
                ),
              ),
            ),
            // -- Category of Products as List
            Positioned(
              right: 0,
              left: AppSizes.defaultSpace,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 6,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSizes.defaultSpace),
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    padding: const EdgeInsets.all(AppSizes.sm),
                    backgroundColor: darkMode
                        ? AppColors.dark
                        : AppColors.white,
                    // border: Border.all(color: AppColors.primary),
                    border: Border.all(color: AppColors.grey),
                    imageUrl: AppImages.productImage3,
                  ),
                ),
              ),
            ),

            // -- AppBar
            CustomAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

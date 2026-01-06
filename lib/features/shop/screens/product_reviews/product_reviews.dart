import 'package:e_commerce_app/common/widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -- AppBar
      appBar: CustomAppBar(
        title: Text("Reviews & Ratings"),
        showBackArrow: true,
      ),

      // -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you use.",
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),

              const OverallProductRating(),

              RatingBarIndicator(
                rating: 3.5,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (_, _) =>
                    const Icon(Iconsax.star1, color: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

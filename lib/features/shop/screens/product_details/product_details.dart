import 'package:e_commerce_app/common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_details_header.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_rating_share.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // final darkMode = HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Product Details Header
            ProductDetailsHeader(),

            // -- Product Details
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  // -- Rating & Share
                  const RatingAndShare(),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  // -- Product Meta Data
                  const ProductMetaData(),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  // -- Product Attributes
                  const ProductAttributes(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("CheckOut"),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // -- Description
                  SectionHeading(title: "Description", showActionButton: false),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  ReadMoreText(
                    "This is product description for product here in the screen. This is a demo description. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque mattis nulla ante, sed bibendum justo laoreet sed. Etiam nulla enim, consectetur id nulla in, lacinia tempor ipsum.",
                    trimLines: 2,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Less",
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // const SizedBox(height: AppSizes.spaceBtwSections),
                  Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // -- Reviews
                      SectionHeading(
                        title: "Reviews(199)",
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => ProductReviewsScreen()),
                        icon: Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

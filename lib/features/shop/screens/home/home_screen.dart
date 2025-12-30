import 'package:e_commerce_app/common/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/products/card/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/search_bar/custom_searchbar.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/section_categories.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  const HomeScreenAppBar(),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  // SearchBar
                  const CustomSearchBar(text: "Search in Store"),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  // Categories List
                  Padding(
                    padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: "Popular Categories",
                          onPressed: () {},
                          showActionButton: false,
                          textColor: AppColors.white,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        const SectionCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  PromoSlider(
                    banners: [
                      AppImages.promoBanner1,
                      AppImages.promoBanner2,
                      AppImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  SectionHeading(title: "Popular Products", onPressed: () {}),
                  // const SizedBox(height: AppSizes.spaceBtwItems),

                  /// -- Popular Products
                  GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const ProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

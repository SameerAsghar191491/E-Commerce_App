import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/widgets/home_searchbar.dart';
import 'package:e_commerce_app/features/shop/screens/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/widgets/section_categories.dart';
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
                  const HomeScreenSearchBar(),
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
              padding: EdgeInsetsGeometry.all(AppSizes.defaultSpace),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.md),
                ),
                child: const Image(image: AssetImage(AppImages.banner3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

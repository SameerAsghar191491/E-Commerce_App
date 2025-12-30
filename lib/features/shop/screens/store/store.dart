import 'package:e_commerce_app/common/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_cart/custom_cartcounter.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/search_bar/custom_searchbar.dart';
import 'package:e_commerce_app/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: CustomAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CartCounterIcon(iconColor: AppColors.dark, onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: AppHelperFunctions.isDarkMode(context)
                    ? AppColors.black
                    : AppColors.white,
                expandedHeight: 440,

                flexibleSpace: Padding(
                  padding: const EdgeInsetsGeometry.all(AppSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search Bar
                      const SizedBox(height: AppSizes.spaceBtwItems),
                      const CustomSearchBar(
                        padding: EdgeInsets.zero,
                        text: "Search In Store",
                        showBorder: true,
                        showBackGround: true,
                      ),
                      const SizedBox(height: AppSizes.spaceBtwSections),

                      /// -- Featured Brands
                      SectionHeading(
                        title: "Featured Brands",
                        onPressed: () {},
                      ),
                      const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

                      GridLayout(
                        mainAxisExtent: 80,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: RoundedContainers(
                              padding: const EdgeInsets.all(AppSizes.sm),
                              showBorder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(
                                children: [
                                  /// -- Icon
                                  Flexible(
                                    child: CircularImage(
                                      isNetworkImage: false,
                                      image: AppImages.clothIcon,
                                      backgroundColor: Colors.transparent,
                                      overlayColor:
                                          AppHelperFunctions.isDarkMode(context)
                                          ? AppColors.white
                                          : AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppSizes.spaceBtwItems / 2,
                                  ),

                                  /// -- Text
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 60,
                                          child:
                                              const BrandTitleWithVerifiedIcon(
                                                title: "Nike",
                                                brandTextSize: TextSizes.large,
                                              ),
                                        ),
                                        Text(
                                          "256 Products",
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container(),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      return SizedBox(
        child: Center(child: Icon(Icons.error, color: AppColors.error)),
      );
    }
  }
}

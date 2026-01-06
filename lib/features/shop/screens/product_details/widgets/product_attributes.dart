import 'package:e_commerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_commerce_app/common/widgets/text/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        RoundedContainers(
          padding: EdgeInsets.all(AppSizes.md),
          backgroundColor: darkMode
              ? AppColors.light.withValues(alpha: 0.1)
              : AppColors.dark.withValues(alpha: 0.1),
          child: Column(
            children: [
              Row(
                children: [
                  SectionHeading(title: "Variation", showActionButton: false),
                  const SizedBox(width: AppSizes.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProductTitleText(title: "Price: ", smallSize: true),
                          Text(
                            "\$25",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: AppSizes.sm),
                          ProductPriceText(price: "20"),
                          // ProductTitleText(title: "\$20"),
                        ],
                      ),
                      Row(
                        children: [
                          ProductTitleText(title: "Status: ", smallSize: true),
                          ProductTitleText(title: "In Stock", smallSize: false),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              ProductTitleText(
                title:
                    "This is the description of the product and it can go up to max 4 lines.",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: "Colors", showActionButton: false),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 8,
              children: [
                MyChoiceChip(
                  text: "Green",
                  selected: true,
                  onSelected: (value) {},
                ),
                MyChoiceChip(
                  text: "Blue",
                  selected: false,
                  onSelected: (value) {},
                ),
                MyChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: "Sizes", showActionButton: false),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Wrap(
              spacing: 8,
              children: [
                MyChoiceChip(
                  text: "EU-32",
                  selected: true,
                  onSelected: (value) {},
                ),
                MyChoiceChip(
                  text: "EU-34",
                  selected: false,
                  onSelected: (value) {},
                ),
                MyChoiceChip(
                  text: "EU-36",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

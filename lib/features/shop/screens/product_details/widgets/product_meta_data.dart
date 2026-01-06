import 'package:e_commerce_app/common/widgets/text/discount_tag.dart';
import 'package:e_commerce_app/common/widgets/text/logo_text_verified_icon.dart';
import 'package:e_commerce_app/common/widgets/text/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -- Discount Tag & Price Tag
        Row(
          children: [
            //  -- Discount Tag
            const DiscountTag(text: "25"),
            const SizedBox(width: AppSizes.spaceBtwItems),
            // -- Original Price
            Text(
              "\$250",
              style: Theme.of(context).textTheme.bodyMedium!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            // -- Discounted Price
            ProductPriceText(price: "175", isLarge: true),
          ],
        ),
    
        const SizedBox(height: AppSizes.spaceBtwItems),
        // -- Product Title
        ProductTitleText(title: "Green Nike Sports Shirt"),
    
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          children: [
            ProductTitleText(title: "Status"),
            const SizedBox(width: AppSizes.spaceBtwItems),
            ProductTitleText(title: "In Stock"),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems * 1.5),
        const LogoTextVerifiedIcon(
          text: "Nike",
          image: AppImages.nikeLogo,
        ),
      ],
    );
  }
}

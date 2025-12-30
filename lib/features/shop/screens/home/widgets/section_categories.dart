import 'package:e_commerce_app/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class SectionCategories extends StatelessWidget {
  const SectionCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 80,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: AppImages.shoeIcon,
            title: "Shoes",
            onTap: () {},
          );
        },
      ),
    );
  }
}

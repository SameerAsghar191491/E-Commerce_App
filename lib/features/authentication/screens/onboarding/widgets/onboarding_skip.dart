import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppSizes.appBarHeight,
      right: AppSizes.defaultSpace,
      child: TextButton(onPressed: () {}, child: const Text("Skip")),
    );
  }
}

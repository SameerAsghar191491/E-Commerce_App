import 'package:e_commerce_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotIndicator extends StatelessWidget {
  const OnBoardingDotIndicator({super.key, required this.myController});

  final PageController myController;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    // 1st way to do it
    // final getXcontroller = OnBoardingController.instance;
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        // 1st way
        // onDotClicked: (index) => getXcontroller.dotNavigationClicked(index),
        // 2nd way
        onDotClicked: (index) =>
            OnBoardingController.instance.dotNavigationClicked(index),
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? AppColors.light : AppColors.dark,
          dotHeight: 6,
        ),
        controller: myController,
        count: 3,
      ),
    );
  }
}

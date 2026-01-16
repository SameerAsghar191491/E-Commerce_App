import 'package:e_commerce_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    // 1st way
    // final getXcontroller = OnBoardingController.instance;
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      right: AppSizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          side: BorderSide(color: dark ? AppColors.primary : AppColors.dark),
          backgroundColor: dark ? AppColors.primary : AppColors.dark,
        ),
        onPressed: () {
          // 1st way
          // if (getXcontroller.currentPageIndex.value == 2) {
          //   /// Go To Login Page
          //   // Get.to(LoginPage());
          // } else {
          //   getXcontroller.pageController.nextPage(
          //     duration: Duration(seconds: 1),
          //     curve: Curves.ease,
          //   );
          // }
          // 2nd way
          if (OnBoardingController.instance.currentPageIndex.value == 2) {
            /// Go To Login Page
            Get.offAll(Login());
          } else {
            OnBoardingController.instance.pageController.nextPage(
              duration: Duration(seconds: 1),
              curve: Curves.ease,
            );
          }
        },
        child: Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}

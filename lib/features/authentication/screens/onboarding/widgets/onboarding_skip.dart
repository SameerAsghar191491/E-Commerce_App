// ignore_for_file: unused_import

import 'package:e_commerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final getXcontroller = OnBoardingController.instance;
    return Positioned(
      top: AppSizes.appBarHeight,
      right: AppSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          getXcontroller.skipPage();

          /// Go to login page directly
          // Get.to(LoginPage());
        },
        child: const Text("Skip"),
      ),
    );
  }
}

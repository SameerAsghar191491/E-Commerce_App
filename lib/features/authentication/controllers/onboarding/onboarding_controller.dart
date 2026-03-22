// ignore_for_file: unused_import

import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when page scroll
  void updatePageIndicator(int value) => currentPageIndex.value = value;

  /// Jump to specific dot selected
  void dotNavigationClicked(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      currentPageIndex.value,
      duration: Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  /// Update current page and jump to next Page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      /// Go To Login Page
      final storage = GetStorage();
      storage.write("isFirstTime", false);
      Get.offAll(() => LoginScreen());
    } else {
      pageController.nextPage(
        duration: Duration(seconds: 1),
        curve: Curves.ease,
      );
    }
  }

  /// Update current index and jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: Duration(seconds: 1),
      curve: Curves.ease,
    );
  }
}

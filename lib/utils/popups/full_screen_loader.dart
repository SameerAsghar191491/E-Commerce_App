import 'package:e_commerce_app/common/widgets/loader/animation_loader.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class FullScreenLoader {
  static void openLoadingDialog(String animation, String text) {
    showDialog(
      useSafeArea: false,
      barrierDismissible:
          false, // The barrier can't be dismissed by tapping outside of it
      context: Get
          .overlayContext!, // Overlaycontext used for overlay screens like loader here and overlay dialogs
      builder: (context) {
        return PopScope(
          canPop: true, // disable popping with back button in mobile
          child: Container(
            color: HelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.white,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250),
                AnimationLoader(
                  animation: animation,
                  text: text,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void stopLoading() {
    Navigator.pop(Get.context!);
  }
}

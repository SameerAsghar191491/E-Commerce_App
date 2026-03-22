import 'package:e_commerce_app/data/repositories/authentication/authetication_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/reset_password.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  final GlobalKey<FormState> emailformKey = GlobalKey<FormState>();

  /* ------------ Reset Password Email Send ------------ */

  Future<void> resetPasswordEmailSend() async {
    try {
      /// check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Loaders.errorSnackBar(title: "No Internet Connection");
        return;
      }

      /// validate textfeild
      if (!emailformKey.currentState!.validate()) return;

      /// loading screen
      FullScreenLoader.openLoadingDialog(
        AppImages.docerAnimation,
        "Resetting your Password...",
      );

      /// send actuall reset password email
      await AuthenticationRepository.instance.sendResetPasswordEmail(
        email.text.trim(),
      );

      /// stop loading
      FullScreenLoader.stopLoading();

      /// send success message
      Loaders.successSnackBar(
        title: "Email Sent",
        message: "Email link sent to reset your password".tr,
      );

      /// redirect to reset password screen
      Get.offAll(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /* ------------ Reset Password Email Send ------------ */

  Future<void> resendResetPasswordEmail() async {
    try {
      /// check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Loaders.errorSnackBar(title: "No Internet Connection");
        return;
      }

      /// loading screen
      FullScreenLoader.openLoadingDialog(
        AppImages.docerAnimation,
        "Resending reset Password email...",
      );

      /// send actuall reset password email
      await AuthenticationRepository.instance.sendResetPasswordEmail(
        email.text.trim(),
      );

      /// stop loading
      FullScreenLoader.stopLoading();

      /// send success message
      Loaders.successSnackBar(
        title: "Email Sent Again",
        message: "Email link sent to reset your password".tr,
      );
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}

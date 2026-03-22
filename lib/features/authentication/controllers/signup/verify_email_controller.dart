import 'dart:async';

import 'package:e_commerce_app/data/repositories/authentication/authetication_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/widgets/success_screen.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerificationLink();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification
  Future<void> sendEmailVerificationLink() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerificationToUser();
      Loaders.successSnackBar(
        title: "Email Sent",
        message: "Check your inbox and verify your email",
      );
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// checking email verified continously for autoredirect
  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: AppImages.successfullyRegisterAnimation,
            title: AppTexts.yourAccountCreatedTitle,
            subTitle: AppTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// check email verified status with button
  void checkEmailVerificationStatus() {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.off(
          () => SuccessScreen(
            image: AppImages.successfullyRegisterAnimation,
            title: AppTexts.yourAccountCreatedTitle,
            subTitle: AppTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      } else if(currentUser != null && !currentUser.emailVerified) {
        Loaders.errorSnackBar(
          title: "Email not verified yet",
          message: "Please verify your email first to continue",
        );
      }
    } catch (e) {
      Loaders.errorSnackBar(title: "Something went wrong", message: e.toString());
      throw "Something went wrong, please try again";
    }
  }
}

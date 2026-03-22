import 'package:e_commerce_app/data/repositories/authentication/authetication_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables

  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormkey = GlobalKey<FormState>();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  GetStorage db = GetStorage();
  // final userController = Get.put(UserController());
  final userController = UserController.instance;

  /* ------------------- Login Method ------------------- */

  Future<void> loginUser() async {
    try {
      /// check for internet access 1st
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      /// validate textformfeilds
      if (!loginFormkey.currentState!.validate()) {
        return;
      }

      /// check if rememberMe is pressed or not
      if (rememberMe.value) {
        db.write("REMEMBER_ME_EMAIL", emailController.text.trim());
        db.write("REMEMBER_ME_PASSWORD", passwordController.text.trim());
      }

      /// show loading screen
      FullScreenLoader.openLoadingDialog(
        AppImages.docerAnimation,
        "Logging you In",
      );

      await AuthenticationRepository.instance.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "An error Occured", message: e.toString());
    }
  }

  /* ------------------- Logout Method ------------------- */

  Future<void> logoutUser() async {
    try {
      await AuthenticationRepository.instance.logout();
    } catch (e) {
      Loaders.errorSnackBar(title: "An error Occured", message: e.toString());
    }
  }

  /* ------------------- Google SignIn Authentication ------------------- */

  Future<void> googleSignIn() async {
    try {
      /// internet connection checking
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Loaders.errorSnackBar(title: "No Internet Connection");
        return;
      }

      /// Open the full loading screen
      FullScreenLoader.openLoadingDialog(
        AppImages.docerAnimation,
        "Logging You In...",
      );

      /// actuall google sign in
      final userCredentials = await AuthenticationRepository.instance
          .signInWithGoogle();

      /// save user data
      await userController.saveUserRecord(userCredentials);

      // userController.fetchUserRecord();

      FullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
      return;
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap", message: e.toString());
      return;
    }
  }
}

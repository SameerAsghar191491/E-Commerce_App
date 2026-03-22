import 'package:e_commerce_app/data/repositories/authentication/authetication_repository.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/models/userModel.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/email_verification.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final obsecurePassword = false.obs;
  bool isConnected = false;
  Rx<bool> checkBox = false.obs;

  /// SignUp
  void signup() async {
    try {
      /// Internet access checking
      isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      /// Validate textformfeilds
      if (!formKey.currentState!.validate()) {
        return;
      }

      /// Privacy checkbox
      if (!checkBox.value) {
        Loaders.warningSnackBar(
          title: "Privacy Policy",
          message: "To continue please agree with Privacy Policy",
        );
        return;
      }

      /// Loading screen
      FullScreenLoader.openLoadingDialog(
        AppImages.docerAnimation,
        "We are Processing your information",
      );

      /// Create user in firebase & return userCredentials
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      /// Parsing userdata from UserModel to Store userdata in firebase
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        userName: userNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        profilePicture: '',
        fullName: "${firstNameController.text.trim()} ${lastNameController.text.trim()}",
      );

      /// Storing userdata in firebase
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserData(newUser);

      /// show the success message
      Loaders.successSnackBar(
        title: "Congragulations",
        message: "Your account has been created! Verify email to continue",
      );

      FullScreenLoader.stopLoading();

      /// move to verify screen
      Get.to(
        () => VerifyEmailScreen(email: emailController.text.trim().toString()),
      );
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}

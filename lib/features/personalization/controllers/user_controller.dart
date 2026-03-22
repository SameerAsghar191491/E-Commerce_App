import 'dart:io';

import 'package:e_commerce_app/data/repositories/authentication/authetication_repository.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/models/userModel.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/personalization/screens/settings/widgets/re_auth_loginForm.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final imagePicker = ImagePicker();
  Rx<bool> profilePicture = false.obs;
  final reHidePassword = false.obs;
  final reEmailController = TextEditingController();
  final rePasswordController = TextEditingController();
  GlobalKey<FormState> reFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  void fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      profileLoading.value = false;
      user(UserModel.empty());
    }
  }

  /// Function to store userData to Firestore
  Future<void> saveUserRecord(UserCredential userCredentials) async {
    try {
      if (userCredentials.user != null) {
        final nameParts = UserModel.nameParts(
          userCredentials.user!.displayName ?? "",
        );
        final userName = UserModel.generateUsername(
          userCredentials.user!.displayName ?? "",
        );

        /// Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          email: userCredentials.user!.email,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          phoneNumber: userCredentials.user!.phoneNumber ?? "",
          userName: userName,
          password: "",
          profilePicture: userCredentials.user!.photoURL ?? "",
          fullName: userCredentials.user!.displayName,
        );

        /// save user data
        await userRepository.saveUserData(user);
      }
    } catch (e) {
      Loaders.errorSnackBar(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your data in your profile",
      );
    }
  }

  // function to change profile picture
  void changeProfilePicture() async {
    try {
      XFile? pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxHeight: 500,
        maxWidth: 500,
      );

      if (pickedImage != null) {
        profilePicture.value = true;
        final imageUrl = await userRepository.uploadImage(
          "Users/Images/ProfilePicture",
          File(pickedImage.path),
        );
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
      }

      if (pickedImage == null) {
        Loaders.errorSnackBar(
          title: "No Image Selected",
          message: "Please select image properly to set on profile",
        );
      }
    } catch (e) {
      profileLoading.value = false;
      Loaders.warningSnackBar(title: "Something went wrong");
    } finally {
      profileLoading.value = false;
    }
  }

  void deleteUserAccountWarningPopup() async {
    try {
      // check for internet 1st
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Loaders.errorSnackBar(title: "No Internet");
        return;
      }

      await showDialog(
        context: Get.overlayContext!,
        builder: (context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              mainAxisSize: .min,
              children: [
                Text(
                  "Delete Account",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Are you sure, You want to delete this Account? This process is not reversible and all of your data will be deleted permenantly",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                // const SizedBox(height: AppSizes.defaultSpace),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: HelperFunctions.isDarkMode(context)
                                ? AppColors.light
                                : Colors.transparent,
                            side: BorderSide(color: AppColors.black),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: AppColors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSizes.defaultSpace / 2),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade400,
                            side: BorderSide.none,
                          ),
                          onPressed: () => deleteUserAccount(),
                          child: Text("Confirm"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  void deleteUserAccount() async {
    FullScreenLoader.openLoadingDialog(
      AppImages.docerAnimation,
      "Processing...",
    );
    // first reauthenticate user
    final auth = AuthenticationRepository.instance;

    final provider = auth.authUser.currentUser!.providerData
        .map((e) => e.providerId)
        .first;

    if (provider.isNotEmpty) {
      // re verify auth email
      if (provider == "google.com") {
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        FullScreenLoader.stopLoading();
        Get.offAll(() => const LoginScreen());
      }
      if (provider == "password") {}
      FullScreenLoader.stopLoading();
      Get.to(() => const ReAuthLoginform());
    }
  }

  Future<void> reAuthenticateUser() async {
    try {
      // check for internet 1st
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Loaders.errorSnackBar(title: "No Internet");
        return;
      }

      // validate textformfeilds
      if (!reFormKey.currentState!.validate()) {
        return;
      }

      // show loading screen
      FullScreenLoader.openLoadingDialog(
        AppImages.docerAnimation,
        "Processing your information...",
      );

      // call the actuall method to reAuthenticate User
      await AuthenticationRepository.instance.reAuthenticateUserCredentials(
        reEmailController.text.trim(),
        rePasswordController.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();

      // stop loading
      FullScreenLoader.stopLoading();

      // redirect to login screen
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}

import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final GlobalKey<FormState> changeNameformKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  void updateNames() async {
    try {
      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();

      // check for the internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Loaders.errorSnackBar(title: "No Internet");
        return;
      }

      // check for textformfeilds using validators
      if (!changeNameformKey.currentState!.validate()) return;

      // show loading screen
      FullScreenLoader.openLoadingDialog(
        AppImages.docerAnimation,
        "Upading your Information",
      );

      // update data in firestore
      Map<String, dynamic> name = {
        "FirstName": firstName,
        "LastName": lastName,
      };
      Map<String, dynamic> fullName = {
        "FullName": "$firstName $lastName",
      };
      
      await userRepository.updateSingleField(name);
      await userRepository.updateSingleField(fullName);

      // update data in the instance "user" in UserController so the changes happen on runtime and update while running the app
      // userController.user.value.firstName = firstName;
      // userController.user.value.lastName = lastName;

      userController.fetchUserRecord();

      // close loading screen
      FullScreenLoader.stopLoading();
      FullScreenLoader.stopLoading();

      // show success message on completion
      Loaders.successSnackBar(
        title: "Congragulations!",
        message: "Your Name is Updated Successfully",
      );

      // get back to profile screen
      // Get.off(() => ProfileScreen());
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      // throw "Something went wrong";
    }
  }
}

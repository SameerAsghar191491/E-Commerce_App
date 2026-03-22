import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginform extends StatelessWidget {
  const ReAuthLoginform({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text("Re-Authenticate User")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: controller.reFormKey,
            child: Column(
              children: [
                const SizedBox(height: AppSizes.spaceBtwSections),
                TextFormField(
                  controller: controller.reEmailController,
                  validator: (_) => Validator.validateEmail(
                    controller.reEmailController.text.trim(),
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: AppTexts.email,
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                Obx(
                  () => TextFormField(
                    controller: controller.rePasswordController,
                    validator: (_) => Validator.validatePassword(
                      controller.rePasswordController.text.trim(),
                    ),
                    obscureText: controller.reHidePassword.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: AppTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.reHidePassword.value =
                            !controller.reHidePassword.value,
                        icon: controller.reHidePassword.value
                            ? Icon(Iconsax.eye_slash)
                            : Icon(Iconsax.eye),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                SizedBox(
                  // height: 50,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        // side: BorderSide.none,
                      ),
                      side: BorderSide.none,
                    ),
                    onPressed: () {
                      // Get.to(() => Signup());
                      controller.reAuthenticateUser();
                    },
                    child: Text(
                      "Verify",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.spaceBtwSections),

            Text(
              AppTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              // textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),

            Text(
              AppTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelLarge,
              // textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSizes.spaceBtwSections * 2),

            Form(
              key: controller.emailformKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => Validator.validateEmail(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: AppTexts.email,
                ),
              ),
            ),

            const SizedBox(height: AppSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Get.to(() => ResetPassword(email: controller.email.text.trim(),));
                  controller.resetPasswordEmailSend();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: Text(AppTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

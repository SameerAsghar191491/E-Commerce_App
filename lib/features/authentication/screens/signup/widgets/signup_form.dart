import 'package:e_commerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/widgets/termsconditions_checkbox.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupController.formKey,
      child: Column(
        children: [
          Row(
            children: [
              // firstName
              Expanded(
                child: TextFormField(
                  controller: signupController.firstNameController,
                  validator: (_) => Validator.validateEmptyText(
                    "FirstName",
                    signupController.firstNameController.value.text.toString(),
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Iconsax.user),
                    labelText: AppTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              // lastName
              Expanded(
                child: TextFormField(
                  controller: signupController.lastNameController,
                  validator: (_) => Validator.validateEmptyText(
                    "LastName",
                    signupController.lastNameController.value.text.toString(),
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Iconsax.user),
                    labelText: AppTexts.lastName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          // userName
          TextFormField(
            controller: signupController.userNameController,
            validator: (_) => Validator.validateEmptyText(
              "UserName",
              signupController.firstNameController.value.text.toString(),
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: AppTexts.username,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          // email
          TextFormField(
            controller: signupController.emailController,
            validator: (_) => Validator.validateEmail(
              signupController.emailController.value.text.trim(),
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Iconsax.direct),
              labelText: AppTexts.email,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          // phoneNumber
          TextFormField(
            controller: signupController.phoneNumberController,
            validator: (_) => Validator.validatePhoneNumber(
              signupController.phoneNumberController.value.text.trim(),
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Iconsax.call),
              labelText: AppTexts.phoneNo,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          // password
          Obx(
            () => TextFormField(
              controller: signupController.passwordController,
              obscureText: signupController.obsecurePassword.value,
              validator: (_) => Validator.validatePassword(
                signupController.passwordController.text.trim(),
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: IconButton(
                  onPressed: () => signupController.obsecurePassword.value =
                      !signupController.obsecurePassword.value,
                  icon: signupController.obsecurePassword.value
                      ? Icon(Iconsax.eye_slash)
                      : Icon(Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          const TermsAndConditionsCheckBox(),
          const SizedBox(height: AppSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () => signupController.signup(),

              // Get.to(() => EmailVerification());
              child: Text(AppTexts.signIn),
            ),
          ),
        ],
      ),
    );
  }
}

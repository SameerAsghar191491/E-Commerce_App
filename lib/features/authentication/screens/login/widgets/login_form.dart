import 'package:e_commerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_app/features/personalization/screens/settings/widgets/re_auth_loginForm.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    loginController.emailController.text =
        loginController.db.read("REMEMBER_ME_EMAIL") ?? "";
    loginController.passwordController.text =
        loginController.db.read("REMEMBER_ME_PASSWORD") ?? "";
    return Form(
      key: loginController.loginFormkey,
      child: Column(
        children: [
          TextFormField(
            controller: loginController.emailController,
            validator: (value) => Validator.validateEmail(
              loginController.emailController.text.trim(),
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: AppTexts.email,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: loginController.passwordController,
              validator: (value) => Validator.validatePassword(
                loginController.passwordController.text.trim(),
              ),
              obscureText: loginController.hidePassword.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: IconButton(
                  onPressed: () => loginController.hidePassword.value =
                      !loginController.hidePassword.value,
                  icon: loginController.hidePassword.value
                      ? Icon(Iconsax.eye_slash)
                      : Icon(Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.defaultSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Obx(
                      () => Checkbox(
                        value: loginController.rememberMe.value,
                        onChanged: (value) =>
                            loginController.rememberMe.value = value!,
                        side: loginController.rememberMe.value
                            ? null
                            : BorderSide(),
                        fillColor: loginController.rememberMe.value
                            ? WidgetStatePropertyAll(AppColors.primary)
                            : null,
                        checkColor: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.sm),
                  Text(AppTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => ForgetPassword());
                },
                child: Text(AppTexts.forgetPassword),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async => await loginController.loginUser(),
              // onPressed: () => Get.to(() => ReAuthLoginform()),
              // Get.off(() => NavigationMenu());
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: Text(AppTexts.signIn),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          SizedBox(
            // height: 50,
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              onPressed: () {
                Get.to(() => const Signup());
              },
              child: Text(
                AppTexts.createAccount,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
        ],
      ),
    );
  }
}

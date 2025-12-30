import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/widgets/success_screen.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                Get.offAll(() => Login());
              },
              icon: Icon(CupertinoIcons.clear),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: AssetImage(AppImages.deliveredEmailIllustration),
                width: HelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Text(
                AppTexts.confirmEmail,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              Text(
                "sameerasghar018@gmail.com",
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              const Text(
                AppTexts.confirmEmailSubTitle,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Get.to(
                      () => SuccessScreen(
                        onPressed: () {
                          Get.offAll(() => const Login());
                        },
                        image: AppImages.staticSuccessIllustration,
                        title: AppTexts.yourAccountCreatedTitle,
                        subTitle: AppTexts.yourAccountCreatedSubTitle,
                      ),
                    );
                  },
                  child: const Text(AppTexts.tContinue),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(AppTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

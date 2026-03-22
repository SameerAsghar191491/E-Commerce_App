import 'package:e_commerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkGrey),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () => LoginController.instance.googleSignIn(),
            icon: Image(
              image: AssetImage(AppImages.google),
              height: AppSizes.iconMd,
            ),
          ),
        ),
        const SizedBox(width: AppSizes.sm),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkGrey),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage(AppImages.facebook),
              height: AppSizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}

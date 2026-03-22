import 'package:e_commerce_app/common/shimmer_effect/shimmer_effect.dart';
import 'package:e_commerce_app/common/widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_cart/custom_cartcounter.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/cart/cart.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(UserController());
    final controller = UserController.instance;
    return CustomAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            AppTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.bodyLarge!.apply(
              color: AppColors.white,
              fontSizeFactor: 0.8,
            ),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const ShimmerEffect(height: 15, width: 80);
            } else {
              return Text(
                textAlign: TextAlign.start,
                controller.user.value.fullName!,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: AppColors.white),
              );
            }
          }),
        ],
      ),
      actions: [
        CartCounterIcon(
          iconColor: AppColors.white,
          onPressed: () => Get.to(() => CartScreen()),
        ),
      ],
    );
  }
}

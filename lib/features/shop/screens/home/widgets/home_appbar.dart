import 'package:e_commerce_app/common/widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_cart/custom_cartcounter.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      isLeading: false,
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
          Text(
            textAlign: TextAlign.start,
            AppTexts.homeAppbarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: AppColors.white),
          ),
        ],
      ),
      actions: [CartCounterIcon(iconColor: AppColors.white, onPressed: () {})],
    );
  }
}

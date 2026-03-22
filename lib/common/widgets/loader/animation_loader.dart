import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoader extends StatelessWidget {
  // const AnimationLoader({super.key});
  const AnimationLoader({
    required this.animation,
    required this.text,
    super.key,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String animation;
  final String text;
  final String? actionText;
  final bool? showAction;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            animation,
            // height: 200,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const SizedBox(height: AppSizes.defaultSpace),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
          showAction!
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.dark,
                    ),
                    child: Text(
                      actionText!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: AppColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

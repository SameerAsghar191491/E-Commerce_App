import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = "View All",
    this.textColor = AppColors.white,
    this.showActionButton = true,
    this.onPressed,
  });

  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: textColor),
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text("button title")),
      ],
    );
  }
}
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text)),
        Expanded(
          flex: 11,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 11,
            backgroundColor: AppColors.grey,
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

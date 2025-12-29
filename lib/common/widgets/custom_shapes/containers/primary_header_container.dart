import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        width: AppHelperFunctions.screenWidth(),
        padding: const EdgeInsets.all(0),
        color: AppColors.primary,
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -135,
                right: -250,
                child: RoundedContainers(
                  backgroundColor: AppColors.textWhite.withValues(alpha: 0.1),
                  radius: 200,
                  height: 400,
                  width: 400,
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: RoundedContainers(
                  backgroundColor: AppColors.textWhite.withValues(alpha: 0.1),
                  radius: 200,
                  height: 400,
                  width: 400,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    this.leadingIcon,
    this.showBackArrow = false,
    this.title,
    this.leadingOnPressed,
  });

  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final Widget? title;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        right: AppSizes.defaultSpace / 2,
        left: AppSizes.defaultSpace / 2,
        // top: AppSizes.appBarHeight / 1.5,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: showBackArrow,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Iconsax.arrow_left),
              )
            : leadingIcon != null
            ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
            : null,
        actions: actions,
        title: title,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}

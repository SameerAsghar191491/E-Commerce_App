import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If we want to add the background color to tabs we have to wrap them in Material Widget
  /// To do that we need [PreferredSized] widget & that's why created custom class. [PreferredSizeWidget]
  const CustomTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);

    return Material(
      color: darkMode ? AppColors.black : AppColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        labelColor: darkMode ? AppColors.white : AppColors.primary,
        unselectedLabelColor: AppColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}

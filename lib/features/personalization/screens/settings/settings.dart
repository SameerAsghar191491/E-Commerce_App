import 'package:e_commerce_app/common/widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/list_tile/user_profile_tile.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:e_commerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/address/address.dart';
import 'package:e_commerce_app/features/personalization/screens/cart/cart.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/features/shop/screens/order/order.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final loginController = Get.put(LoginController());
    bool isNetworkImage = false;
    if (controller.user.value.profilePicture!.isNotEmpty) {
      isNetworkImage = true;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // const SizedBox(height: AppSizes.spaceBtwSections),
                  // -- AppBar
                  CustomAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: AppColors.white),
                    ),
                  ),
                  // const SizedBox(height: AppSizes.spaceBtwItems),

                  // User Profile Card
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppSizes.defaultSpace / 2,
                    ),
                    child: UserProfileTile(
                      isNetworkImage: isNetworkImage, 
                      image: isNetworkImage
                          ? controller.user.value.profilePicture!
                          : AppImages.user,
                      title: controller.user.value.fullName ?? "",
                      subTitle: controller.user.value.email ?? "",
                      icon: Iconsax.edit,
                      onPressed: () {
                        Get.to(() => ProfileScreen());
                      },
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),

            // -- Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  // -- Account Settings
                  SectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  SettingsMenuTile(
                    onTap: () => Get.to(() => UserAddressScreen()),
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping addresses',
                  ),
                  SettingsMenuTile(
                    onTap: () => Get.to(() => CartScreen()),
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products & move to checkout',
                  ),
                  SettingsMenuTile(
                    onTap: () => Get.to(() => OrderScreen()),
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress & completed orders',
                    // onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all discount coupons',
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage & connected accounts',
                  ),

                  // -- App Settings
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  SectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subTitle: "Upload Data to your Cloud Firebase",
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: "GeoLocation",
                    subTitle: "Set recommendation based on location",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security,
                    title: "Safe Mode",
                    subTitle: "Search result is safe for all ages",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subTitle: "Set image quality to be seen",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: AppSizes.defaultSpace),
                  OutlinedButton(
                    // style: OutlinedButton.styleFrom(side: BorderSide(width: 1)),
                    onPressed: () => showDialog(
                      context: Get.overlayContext!,
                      builder: (context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: .center,
                            crossAxisAlignment: .center,
                            mainAxisSize: .min,
                            children: [
                              Text(
                                "Logout",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Are you sure, You want to logout?",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              // const SizedBox(height: AppSizes.defaultSpace),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              HelperFunctions.isDarkMode(
                                                context,
                                              )
                                              ? AppColors.light
                                              : Colors.transparent,
                                          side: BorderSide(
                                            color: AppColors.black,
                                          ),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppSizes.defaultSpace / 2,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          // backgroundColor: Colors.red.shade400,
                                          side: BorderSide.none,
                                        ),
                                        onPressed: () =>
                                            loginController.logoutUser(),
                                        child: Text("Confirm"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    child: Center(child: Text("Logout")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

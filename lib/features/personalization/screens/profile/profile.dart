import 'dart:io';

import 'package:e_commerce_app/common/widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/changeName.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppBar(title: Text("Profile"), showBackArrow: true),

      // -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // -- Profile Picture
              Obx(() {
                String profilePicture = controller.user.value.profilePicture!;
                final image = profilePicture.isNotEmpty
                    ? profilePicture
                    : AppImages.user;
                return CircularImage(
                  isNetworkImage: profilePicture.isNotEmpty,
                  image: image,
                  width: 80,
                  height: 80,
                );
              }),
              TextButton(
                child: const Text("Change Profile Picture"),
                onPressed: () => controller.changeProfilePicture(),
              ),

              // Details
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const SectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              ProfileMenu(
                title: "Name",
                value: controller.user.value.fullName ?? "",
                onPressed: () => Get.to(() => Changename()),
              ),
              // ProfileMenu(
              //   title: "First Name",
              //   value: controller.user.value.firstName ?? "",
              //   onPressed: () {},
              // ),
              // ProfileMenu(
              //   title: "LastName",
              //   value: controller.user.value.lastName ?? "",
              //   onPressed: () {},
              // ),
              ProfileMenu(
                title: "UserName",
                value: controller.user.value.userName ?? "",
                onPressed: () {},
              ),

              // const SizedBox(height: AppSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              // Heading Personal Info
              SectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),

              ProfileMenu(
                title: "User ID",
                value: controller.user.value.id ?? "",
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(text: controller.user.value.id ?? ""),
                  );
                  // ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
                  //   const SnackBar(content: Text('Text copied to clipboard')),
                  // );
                },
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                title: "E-mail",
                value: controller.user.value.email ?? "",
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(text: controller.user.value.email ?? ""),
                  );
                },
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                title: "Phone Number",
                value: controller.user.value.phoneNumber ?? "",
                onPressed: () {},
              ),
              ProfileMenu(title: "Gender", value: "Male", onPressed: () {}),
              ProfileMenu(
                title: "Date of Birth",
                value: "10 Oct, 1994",
                onPressed: () {},
              ),

              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteUserAccount(),
                  child: Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

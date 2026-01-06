import 'package:e_commerce_app/common/widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Profile"), showBackArrow: true),

      // -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // -- Profile Picture
              Column(
                children: [
                  CircularImage(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    image: AppImages.user,
                    width: 80,
                    height: 80,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Change Profile Picture"),
                  ),
                ],
              ),

              // Details
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const SectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),

              ProfileMenu(
                title: "Name",
                value: "Coding with Sameer",
                onPressed: () {},
              ),
              ProfileMenu(
                title: "UserName",
                value: "coding_with_sameer",
                onPressed: () {},
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),
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
                value: "45689",
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                title: "E-mail",
                value: "coding_with_t",
                onPressed: () {},
              ),
              ProfileMenu(
                title: "Phone Number",
                value: "+92-317-8059528",
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
                  onPressed: () {},
                  child: Text(
                    "Close Account",
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

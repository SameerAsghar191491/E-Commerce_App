import 'package:e_commerce_app/common/widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';

class Changename extends StatelessWidget {
  const Changename({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    controller.firstNameController.text =
        controller.userController.user.value.firstName!;
    controller.lastNameController.text =
        controller.userController.user.value.lastName!;

    return Scaffold(
      appBar: CustomAppBar(showBackArrow: true, title: Text("Change Name")),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Form(
          key: controller.changeNameformKey,
          child: Column(
            children: [
              Text(
                "Use real name for easy verification. This name will appear on several pages",
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              TextFormField(
                controller: controller.firstNameController,
                validator: (_) => Validator.validateEmptyText(
                  "First Name",
                  controller.firstNameController.value.text.toString(),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: AppTexts.firstName,
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              TextFormField(
                controller: controller.lastNameController,
                validator: (_) => Validator.validateEmptyText(
                  "Last Name",
                  controller.lastNameController.value.text.toString(),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: AppTexts.lastName,
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        side: BorderSide.none,
                      ),
                      onPressed: () => controller.updateNames(),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

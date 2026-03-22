import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,
    super.key,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: AppSizes.spaceBtwItems),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(title, style: Theme.of(context).textTheme.bodySmall),
            ),
            Expanded(
              flex: 5,
              child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
            ),
            // Expanded(child: Icon(icon, size: 18)),
            Expanded(
              child: IconButton(
                icon: Icon(icon, size: 18),
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

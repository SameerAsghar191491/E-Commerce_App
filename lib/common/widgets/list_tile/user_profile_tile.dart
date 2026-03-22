import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    required this.title,
    required this.subTitle,
    super.key,
    this.onPressed,
    this.icon,
    required this.image,
    this.isNetworkImage = false,
  });

  final VoidCallback? onPressed;
  final IconData? icon;
  final String title;
  final String subTitle;
  final String image;
  final bool isNetworkImage;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RoundedImage(
        height: 56,
        width: 56,
        isNetworkImage: isNetworkImage,
        imageUrl: image,
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: AppColors.white),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: AppColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.white),
      ),
    );
  }
}

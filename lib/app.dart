// ignore_for_file: unused_import

import 'package:e_commerce_app/bindings/general_bindings.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/personalization/screens/address/address.dart';
import 'package:e_commerce_app/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:e_commerce_app/features/personalization/screens/cart/cart.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/screens/brands/all_brands.dart';
import 'package:e_commerce_app/features/shop/screens/brands/brand_products.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_app/features/shop/screens/home/home_screen.dart';
import 'package:e_commerce_app/features/shop/screens/order/order.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/features/shop/screens/store/store.dart';
import 'package:e_commerce_app/features/shop/screens/subcategory/subcategory.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/splash_screen.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// -- Use this Class to setup themes, intial Bindings, any animations and much more using Material Widget
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(backgroundColor: AppColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white,),),),
    );
  }
}

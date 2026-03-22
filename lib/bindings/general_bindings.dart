import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:get/instance_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
    // Get.put(LoginController());
    Get.put(UserController());
  }
}

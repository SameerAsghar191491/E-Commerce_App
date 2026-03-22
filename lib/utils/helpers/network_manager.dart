import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final connectivityStatus = ConnectivityResult.none.obs;

  @override
  onInit() {
    super.onInit();
    _connectivitySubscription = connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    connectivityStatus.value = result.isNotEmpty ? result.first : ConnectivityResult.none;
    if (connectivityStatus.value == ConnectivityResult.none || result.isEmpty) {
      Loaders.customSnackBar(message: 'No Internet Connection');
    }
  }

  /// Continously listens to connectivity result

  /// function to manually check the Internet Connection
  Future<bool> isConnected() async {
    final List<ConnectivityResult> result = await connectivity
        .checkConnectivity();

    if (result.contains(ConnectivityResult.none)) {
      Loaders.errorSnackBar(
        title: "No Internet",
        message: "Please check your internet connection",
      );
      return false;
    } else {
      return true;
    }
  }
}

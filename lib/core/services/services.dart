// Package imports:
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/core/services/network/network.dart';

class ServiceLocator implements Bindings {
  @override
  void dependencies() {
    Get.put(const Uuid());
    Get.put(NetworkManager());
  }
}

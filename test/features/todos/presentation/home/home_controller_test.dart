// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/home/controllers/home_controller.dart';

void main() {
  late HomeController homeController;

  setUpAll(() {
    homeController = HomeController();
  });

  group('HomeController Test', () {
    test('should initialize with index: 0 (default)', () async {
      // Initialize GetX bindings
      Get.put(homeController);

      // Verify that the correct default index.
      expect(homeController.pageIndex, 0);
    });

    test('should set page index', () async {
      // Set page index to 1
      homeController.setPage(1);

      // Verify that the correct default index.
      expect(homeController.pageIndex, 1);
    });
  });
}

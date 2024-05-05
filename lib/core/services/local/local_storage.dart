// Package imports:
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends GetxService {
  late final SharedPreferences _prefs;

  static LocalStorageService get to => Get.find<LocalStorageService>();

  Future<LocalStorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  // Other methods for retrieving data
  // ...
  // ...
}

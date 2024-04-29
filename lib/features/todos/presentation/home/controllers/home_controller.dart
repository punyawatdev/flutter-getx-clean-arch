// Package imports:
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;

  void setPage(int index) => _pageIndex.value = index;
}

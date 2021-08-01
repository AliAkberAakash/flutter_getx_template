import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/home/content/home_content_view.dart';

class HomeContainerController extends GetxController {
  late Widget body;
  late int selectedBottomBarIndex;
  late RxInt notificationCount;

  @override
  void onInit() {
    body = HomeContentView();
    selectedBottomBarIndex = 0;
    notificationCount = 10.obs;

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeBottomBarIndex(int index) {
    selectedBottomBarIndex = index;

    switch (index) {
      case 0:
        body = HomeContentView();
        break;

      default:
        break;
    }

    update(['bottom_bar', 'body']);
  }
}

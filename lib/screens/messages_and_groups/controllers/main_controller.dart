import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  Rx<int> currentPageIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void navigateToPage(int pageIndex) {
    if (currentPageIndex.value != pageIndex) {
      currentPageIndex.value = pageIndex;
      pageController.jumpToPage(pageIndex);
    }
  }

  void reset() {
    currentPageIndex.value = 0;
    pageController.jumpToPage(0);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

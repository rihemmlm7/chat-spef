import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OnBoardingControllerGroupOptions extends GetxController {
  static OnBoardingControllerGroupOptions get instance => Get.find();


  Rx<int> currentPageIndex = 0.obs;
  final pageController = PageController();


  void updatePageIndicator(index) => currentPageIndex.value = index;

  void navigateToPage(int pageIndex) {
    currentPageIndex.value = pageIndex;
    pageController.jumpToPage(pageIndex);
  }

  void resetToDiscussionTab() {
    currentPageIndex.value = 0;
    pageController.jumpToPage(0);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingControllerGroupOptions extends GetxController {
  static OnBoardingControllerGroupOptions get instance => Get.find();

  /// Variables
  Rx<int> currentPageIndex = 0.obs;
  final pageController = PageController();

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;



  void navigateToPage(int pageIndex) {
    currentPageIndex.value = pageIndex;
    pageController.jumpToPage(pageIndex);
    // Here you would update your PageController to change the page
    // pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
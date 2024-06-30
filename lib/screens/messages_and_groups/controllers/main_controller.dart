import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  Rx<int> currentPageIndex = 0.obs;
  late final PageController pageController; // Declare the PageController here

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(); // Initialize the PageController when the controller is initialized
  }

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void navigateToPage(int pageIndex) {
    if (currentPageIndex.value != pageIndex) {
      currentPageIndex.value = pageIndex;
      pageController.jumpToPage(pageIndex); // Make sure this is the only PageView that uses this controller
    }
  }

  @override
  void onClose() {
    pageController.dispose(); // Dispose of the controller when this controller is being removed
    super.onClose();
  }
}

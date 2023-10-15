import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  onPageChanged(int index) {
    currentPage.value = index;
  }
}

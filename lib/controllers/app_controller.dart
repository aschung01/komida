import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find<AppController>();
  final GlobalKey scaffoldKey = GlobalKey();
  final TextEditingController nameTextController = TextEditingController();
  final PageController questionPageController = PageController();
  final RxInt page = 0.obs;
  final Rx<int?> rice = Rx<int?>(null);
  final Rx<int?> meat = Rx<int?>(null);
  final Rx<int?> veg = Rx<int?>(null);
  final Rx<int?> pickle = Rx<int?>(null);
    ConfettiController confettiControllerTop =
      ConfettiController(duration: const Duration(seconds: 1));
  ConfettiController confettiControllerLeft =
      ConfettiController(duration: const Duration(seconds: 1));
  ConfettiController confettiControllerRight =
      ConfettiController(duration: const Duration(seconds: 1));

  void nextPage() {
    page.value++;
    questionPageController.animateToPage(
      page.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    page.value--;
    questionPageController.animateToPage(
      page.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void reset() {
    page.value = 0;
    rice.value = null;
    meat.value = null;
    veg.value = null;
    pickle.value = null;
  }
}

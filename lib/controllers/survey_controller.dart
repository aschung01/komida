import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komida/services/api_service.dart';
import 'package:platform_device_id/platform_device_id.dart';

class SurveyController extends GetxController {
  static SurveyController get to => Get.find<SurveyController>();
  final GlobalKey scaffoldKey = GlobalKey();
  TextEditingController nameTextController = TextEditingController();
  late PageController questionPageController = PageController();
  RxInt page = 0.obs;
  Rx<int?> rice = Rx<int?>(null);
  Rx<int?> meat = Rx<int?>(null);
  Rx<int?> veg = Rx<int?>(null);
  Rx<int?> pickle = Rx<int?>(null);
  late String? deviceKey;
  ConfettiController confettiControllerTop =
      ConfettiController(duration: const Duration(seconds: 1));
  ConfettiController confettiControllerLeft =
      ConfettiController(duration: const Duration(seconds: 1));
  ConfettiController confettiControllerRight =
      ConfettiController(duration: const Duration(seconds: 1));

  @override
  void onInit() async {
    super.onInit();
    deviceKey = await PlatformDeviceId.getDeviceId;
    questionPageController = PageController();
    print(deviceKey);
  }

  @override
  void onClose() {
    super.onClose();
    questionPageController.dispose();
  }

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

  Future<void> postResponse() async {
    print(deviceKey);
    if (deviceKey != null) {
      SurveyApiService.postResponse(
          deviceKey!, rice.value!, meat.value!, veg.value!, pickle.value!);
    }
  }
}

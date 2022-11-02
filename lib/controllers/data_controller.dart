import 'dart:async';

import 'package:get/get.dart';
import 'package:komida/services/api_service.dart';

class DataController extends GetxController {
  static DataController get to => Get.find<DataController>();
  RxList<int> riceData = <int>[].obs;
  RxList<int> meatData = <int>[].obs;
  RxList<int> vegData = <int>[].obs;
  RxList<int> pickleData = <int>[].obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }

  Future<void> getData() async {
    List<dynamic> _data = await SurveyApiService.getData();
    riceData.clear();
    meatData.clear();
    vegData.clear();
    pickleData.clear();
    riceData.addAll(_data[0].cast<int>());
    meatData.addAll(_data[1].cast<int>());
    vegData.addAll(_data[2].cast<int>());
    pickleData.addAll(_data[3].cast<int>());
  }
}

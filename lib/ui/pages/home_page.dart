import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:komida/constants/constants.dart';
import 'package:komida/controllers/app_controller.dart';
import 'package:komida/ui/widgets/button.dart';
import 'package:komida/ui/widgets/input_field.dart';
import 'package:get/get.dart';

const String _gimbapImage = 'assets/images/gimbap.png';

class HomePage extends GetView<AppController> {
  const HomePage({Key? key}) : super(key: key);

  void _onStartPressed() {
    controller.reset();
    Get.toNamed('/question');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        currentFocus.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(_gimbapImage),
              const Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              const Text(
                '김밥 취향으로 알아보는\n성격 테스트',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'BmHanna11yrs',
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 40),
                child: SizedBox(
                  width: 320,
                  height: 45,
                  child: InputField(
                    controller: controller.nameTextController,
                    onChanged: (String s) {
                      controller.update();
                    },
                  ),
                ),
              ),
              GetBuilder<AppController>(builder: (_) {
                return ElevatedActionButton(
                  buttonText: '시작하기',
                  onPressed: _onStartPressed,
                  activated: _.nameTextController.text.length > 1,
                );
              }),
              const Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset(komidaLogo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

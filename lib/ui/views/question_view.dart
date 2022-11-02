import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:komida/constants/constants.dart';
import 'package:komida/controllers/survey_controller.dart';
import 'package:komida/ui/pages/home_page.dart';
import 'package:komida/ui/pages/question1_page.dart';
import 'package:komida/ui/pages/question2_page.dart';
import 'package:komida/ui/pages/question3_page.dart';
import 'package:komida/ui/pages/question4_page.dart';
import 'package:komida/ui/widgets/button.dart';
import 'package:komida/ui/widgets/progress_indicator.dart';
import 'package:get/get.dart';

class QuestionView extends GetView<SurveyController> {
  const QuestionView({Key? key}) : super(key: key);

  void _onBackPressed() {
    if (controller.page.value == 0) {
      Get.back();
    } else {
      controller.previousPage();
    }
  }

  void _onNextPressed() {
    if (controller.page.value == 3) {
      Get.toNamed('/result');
      controller.postResponse();
    }
    controller.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    late String _buttonText;
    bool _isActivated = false;

    final List<Widget> _pages = [
      const Question1Page(),
      const Question2Page(),
      const Question3Page(),
      const Question4Page(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetX<SurveyController>(
        builder: (_) {
          if (_.page.value == 3) {
            _buttonText = '결과 확인하기';
          } else {
            _buttonText = '다음';
          }

          switch (_.page.value) {
            case 0:
              if (_.rice.value != null) {
                _isActivated = true;
              } else {
                _isActivated = false;
              }
              break;
            case 1:
              if (_.meat.value != null) {
                _isActivated = true;
              } else {
                _isActivated = false;
              }
              break;
            case 2:
              if (_.veg.value != null) {
                _isActivated = true;
              } else {
                _isActivated = false;
              }
              break;
            case 3:
              if (_.pickle.value != null) {
                _isActivated = true;
              } else {
                _isActivated = false;
              }
              break;
            default:
              _isActivated = false;
              break;
          }

          return Column(
            children: [
              LinearProgressBar(percent: (_.page.value + 1) / 4),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    splashRadius: 20,
                    onPressed: _onBackPressed,
                  ),
                ),
              ),
              const Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              SizedBox(
                height: 320,
                child: PageView(
                  controller: controller.questionPageController,
                  children: _pages,
                ),
              ),
              ElevatedActionButton(
                buttonText: _buttonText,
                onPressed: _onNextPressed,
                activated: _isActivated,
              ),
              const Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset(komidaLogo),
              ),
            ],
          );
        },
      ),
    );
  }
}

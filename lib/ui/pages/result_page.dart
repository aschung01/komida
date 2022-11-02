import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:komida/constants/constants.dart';
import 'package:komida/controllers/survey_controller.dart';
import 'package:get/get.dart';
import 'package:komida/ui/widgets/button.dart';

class ResultPage extends GetView<SurveyController> {
  const ResultPage({Key? key}) : super(key: key);

  void _onResetPressed() {
    Get.offAllNamed('/');
    controller.nameTextController.clear();
    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () {
        controller.confettiControllerLeft.play();
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${controller.nameTextController.text}님은...',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: 'BmHanna11yrs',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ...List.generate(
                4,
                (int index) {
                  late String _text;
                  switch (index) {
                    case 1:
                      _text = meatResults[controller.meat.value!];
                      break;
                    case 2:
                      _text = vegResults[controller.veg.value!];
                      break;
                    case 3:
                      _text = pickleResults[controller.pickle.value!];
                      break;
                    default:
                      _text = riceResults[controller.rice.value!];
                      break;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        _text,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'BmHannaAir',
                        ),
                      ),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 7.5,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedActionButton(
                  buttonText: '처음으로', onPressed: _onResetPressed),
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
          ),
          Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: controller.confettiControllerLeft,
              blastDirection: 0,
              maxBlastForce: 30, // set a lower max blast force
              minBlastForce: 2, // set a lower min blast force
              emissionFrequency: 0.05,
              numberOfParticles: 5, // a lot of particles at once
              gravity: 0.1,
              shouldLoop: true,
              minimumSize: Size(10, 5),
              maximumSize: Size(20, 10),
            ),
          ),
        ],
      ),
    );
  }
}

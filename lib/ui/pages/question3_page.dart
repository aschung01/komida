import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:komida/constants/constants.dart';
import 'package:komida/controllers/survey_controller.dart';
import 'package:komida/ui/widgets/button.dart';
import 'package:komida/ui/widgets/progress_indicator.dart';

class Question3Page extends GetView<SurveyController> {
  const Question3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetX<SurveyController>(
        builder: (_) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(35, 0, 35, 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '선호하는 채소류를 하나 선택해주세요',
                    textAlign: TextAlign.left,
                    style: TextStyle(
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
                      _text = '오이';
                      break;
                    case 2:
                      _text = '시금치';
                      break;
                    case 3:
                      _text = '우엉';
                      break;
                    default:
                      _text = '당근';
                      break;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RadioListTile(
                      title: Text(
                        _text,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'BmHannaAir',
                        ),
                      ),
                      value: index,
                      groupValue: _.veg.value,
                      activeColor: Colors.black,
                      onChanged: (int? value) {
                        if (value != null) {
                          _.veg.value = value;
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

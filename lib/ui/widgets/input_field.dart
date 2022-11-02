import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:komida/constants/constants.dart';

const String _hintText = '이름을 입력해주세요';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  const InputField({
    Key? key,
    required this.controller,
     this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: _hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      style: const TextStyle(
        fontSize: 14,
        fontFamily: 'BmHannaAir',
        color: Colors.black,
      ),
      onChanged: onChanged,
      textAlign: TextAlign.center,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:komida/constants/constants.dart';
import 'package:get/get.dart';

class LinearProgressBar extends StatelessWidget {
  final double percent;
  const LinearProgressBar({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrayColor,
      height: 15,
      width: context.width,
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: context.width * percent,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.black,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:komida/constants/constants.dart';

class ElevatedActionButton extends StatelessWidget {
  final String buttonText;
  final dynamic Function()? onPressed;
  final bool? activated;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Color? disabledColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final BorderSide? borderSide;
  const ElevatedActionButton({
    Key? key,
    required this.buttonText,
    required dynamic Function() this.onPressed,
    this.activated,
    this.height = 45,
    this.width = 200,
    this.backgroundColor = Colors.black,
    this.overlayColor,
    this.disabledColor = deepGrayColor,
    this.borderRadius = 50,
    this.borderSide,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return disabledColor ?? deepGrayColor;
          }
          return backgroundColor!; // Use the component's default.
        },
      ),
      overlayColor: MaterialStateProperty.all(overlayColor),
      minimumSize: MaterialStateProperty.all(const Size(250, 50)),
      textStyle: MaterialStateProperty.all(const TextStyle(
        fontSize: 16,
      )),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
      )),
      side: borderSide != null ? MaterialStateProperty.all(borderSide) : null,
      elevation: MaterialStateProperty.all(0),
    );

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            buttonText,
            style: textStyle ??
                TextStyle(
                  color: (activated != null ? activated! : true)
                      ? ((int.parse(
                                  backgroundColor.toString().substring(10, 16),
                                  radix: 16) <
                              int.parse('800000', radix: 16))
                          ? Colors.white
                          : lightGrayColor)
                      : Colors.white,
                  fontFamily: 'BmHannaAir',
                ),
          ),
        ),
        onPressed: (activated == null || activated!) ? onPressed : null,
        style: style,
      ),
    );
  }
}

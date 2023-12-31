import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const TextWidget(
      {Key? key,
      required this.label,
      this.fontSize = 15,
      this.color,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label,
    style: TextStyle(color: color ?? Colors.white,
    fontSize: fontSize,
    fontWeight: fontWeight ?? FontWeight.w500
    ),
    );
  }
}

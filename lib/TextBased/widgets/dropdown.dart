import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/Constants.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String currentModel = 'Model1';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(dropdownColor: Constants.scaffoldBackgroundColor, items: Constants.getModelsItem, value: currentModel, onChanged: (value) {
      setState(() {
        currentModel = value.toString();
      });
    },);
  }
}

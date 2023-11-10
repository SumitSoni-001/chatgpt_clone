import 'package:flutter/material.dart';
import '../constants/Constants.dart';
import '../widgets/TextWidget.dart';
import '../widgets/dropdown.dart';

class ModelService {
  static Future<void> showModalSheet({ required BuildContext context }) async {
    await showModalBottomSheet(
        context: context,
        backgroundColor: Constants.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: TextWidget(label: "Choose Model: ", fontSize: 16)),
                Flexible(flex:2, child: DropDownWidget())
              ],
            ),
          );
        });
  }
}
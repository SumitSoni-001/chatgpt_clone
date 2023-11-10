import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../TextBased/constants/Constants.dart';

class FeatureBox extends StatelessWidget {
  final Color boxColor;
  final String featureName;
  final String featureDesc;
  const FeatureBox({
    super.key,
    required this.boxColor,
    required this.featureName,
    required this.featureDesc
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
      margin: EdgeInsets.symmetric(horizontal: 30).copyWith(top: 15),
      decoration: BoxDecoration(border: Border.all(color: boxColor), borderRadius: BorderRadius.circular(15.0), color: boxColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(featureName, style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Cera-Pro', fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(featureDesc, style: TextStyle(fontSize:15.0, color: Colors.black, fontFamily: 'Cera-Pro')),
        ],
      ),
    );
  }
}

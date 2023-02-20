import 'package:flutter/material.dart'; 
 import 'package:bmi_calculator/constants.dart';

class ReusableCardChild extends StatelessWidget {
  final IconData? cardIcon;
  final String? cardText;
  
  ReusableCardChild({this.cardIcon, this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        cardIcon,
        size: 60.0,
      ),
      SizedBox(
        height: 15.0,
      ),
      Text('$cardText', style: kIconTextStyle)
    ]);
  }
}

import 'package:flutter/material.dart'; 
import 'package:bmi_calculator/constants.dart';
const bottomHeight = 80.0;

class BottomButton extends StatelessWidget {
  const BottomButton({required this.onTap, required this.buttonText});
  final VoidCallback onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        child: Center(
            child: Text(
          buttonText,
          style: kLargeButtonStyle,
        )),
        width: double.infinity,
        height: bottomHeight,
      ),
    );
  }
}


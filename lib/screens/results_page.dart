import 'input_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/resusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class Results extends StatelessWidget {
  const Results(
      {required this.bmiResult,
      required this.intepretation,
      required this.resultText});
  final String bmiResult;
  final String intepretation;
  final String resultText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'My results',
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      bmiResult,
                      textAlign: TextAlign.center,
                      style: kBMIStyle,
                    ),
                    Text(
                      intepretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0),
                    )
                  ],
                ),
              )),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

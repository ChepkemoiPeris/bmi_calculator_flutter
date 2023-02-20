import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/resusable_card.dart';
import 'package:bmi_calculator/components/reusable_card_child.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  double _currentSliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableCardChild(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: ReusableCardChild(
                        cardIcon: FontAwesomeIcons.venus,
                        cardText: 'FEMALE',
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kIconTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeightTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kIconTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 26.0),
                        overlayColor: Color(0x29EB1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: ((newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kIconTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kHeightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kIconTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kHeightTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Results(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  intepretation: calc.getIntepretation(),
                );
              }));
            },
          )
        ],
      ),
    );
  }
}

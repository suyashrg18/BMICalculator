import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/bottom_button.dart';

//custom imports
import 'package:bmi_calculator/card_widget.dart';
import 'card_content.dart';
import 'constants.dart';
import 'round_icon_btn.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/bmi_brain.dart';

enum Gender { male, female }

class BMIInputPage extends StatefulWidget {
  @override
  _BMIInputPageState createState() => _BMIInputPageState();
}

class _BMIInputPageState extends State<BMIInputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;


  void incrementWeight() {
    setState(() {
      weight++;
    });
  }

  void decrementWeight() {
    setState(() {
      weight--;
    });
  }

  void incrementAge() {
    setState(() {
      age++;
    });
  }

  void decrementAge() {
    setState(() {
      age--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CardWidget(
                        tapHandler: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        color: selectedGender == Gender.male
                            ? kACTIVE_CARD_COLOR
                            : kINACTIVE_CARD_COLOR,
                        cardChild: CardContent(
                            cardIcon: FontAwesomeIcons.mars, cardText: 'MALE'),
                      )),
                  Expanded(
                      child: CardWidget(
                        tapHandler: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        color: selectedGender == Gender.female
                            ? kACTIVE_CARD_COLOR
                            : kINACTIVE_CARD_COLOR,
                        cardChild: CardContent(
                            cardIcon: FontAwesomeIcons.venus,
                            cardText: 'FEMALE'),
                      ))
                ],
              ),
            ), //first row with 2 cards
            Expanded(
                child: CardWidget(
                    color: kACTIVE_CARD_COLOR,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kTEXT_STYLE_CONST,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kHEAVY_FONT_STYLE,
                            ),
                            Text(
                              ' cm',
                              style: kTEXT_STYLE_CONST,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x1fEB1555),
                              trackHeight: 0.5),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double sliderChangeValue) {
                              setState(() {
                                height = sliderChangeValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ))),

            //single layout card
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CardWidget(
                        color: kACTIVE_CARD_COLOR,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kTEXT_STYLE_CONST,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: kHEAVY_FONT_STYLE,
                                ),
                                Text(
                                  ' kgs',
                                  style: kTEXT_STYLE_CONST,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    iconData: FontAwesomeIcons.plus,
                                    clickHandler: () {
                                      incrementWeight();
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    iconData: FontAwesomeIcons.minus,
                                    clickHandler: () {
                                      decrementWeight();
                                    })
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      child: CardWidget(
                        color: kACTIVE_CARD_COLOR,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kTEXT_STYLE_CONST,
                            ), SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  age.toString(),
                                  style: kHEAVY_FONT_STYLE,
                                ),
                                Text(
                                  ' yrs',
                                  style: kTEXT_STYLE_CONST,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    iconData: FontAwesomeIcons.plus,
                                    clickHandler: () {
                                      incrementAge();
                                    }
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    iconData: FontAwesomeIcons.minus,
                                    clickHandler: () {
                                      decrementAge();
                                    }
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ), //last row with 2 cards

            BottomButton(
              title: 'Calculate',
              buttonCLick: () {
                BMIBrain brain = BMIBrain(height: height, weight: weight);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage(value:brain.bmiValue(),result: brain.bmiResult(),interpretation: brain.bmiInterpretation(),)));
              },
            ) //bottom container
          ],
        ),
      ),
    );
  }
}

/* */


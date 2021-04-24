import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/card_widget.dart';
import 'package:bmi_calculator/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String value;
  final String interpretation;


  ResultPage({@required this.value,@required this.result,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1, child: Container(child: Text('Your Result', style: kBIG_FONT_STYLE),padding: EdgeInsets.all(15.0),alignment: Alignment.bottomLeft,),
            ),
            Expanded(
                flex: 5,
                child: CardWidget(
                  color: kINACTIVE_CARD_COLOR,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(result, style: kResultTextStyle),
                      Text(
                        value,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            BottomButton(
              title: 'RE-CALCULATE',
              buttonCLick: (){
                Navigator.pop(context);
              },
            )

          ],
        ),
      ),
    );
  }
}

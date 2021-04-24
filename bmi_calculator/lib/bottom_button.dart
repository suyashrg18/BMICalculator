import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class BottomButton extends StatelessWidget {
  final String title;
  final Function buttonCLick;


  BottomButton({this.title, this.buttonCLick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonCLick,
      child: Container(
        child: Center(child: Text(title,style: kBOLD_TEXT_STYLE)),
        color: kBOTTOM_CONTAINER_COLOR,
        width: double.infinity,
        height: kBOTTOM_CONTAINER_HEIGHT,
      ),
    );
  }
}

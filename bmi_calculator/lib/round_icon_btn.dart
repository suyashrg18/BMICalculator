import 'package:flutter/material.dart';

const ICON_CONSTRAINTS = BoxConstraints.tightFor(
  width: 40.0,
  height: 40.0,
);

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function clickHandler;

  RoundIconButton({this.iconData,this.clickHandler});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:clickHandler,
      fillColor: Color(0xFF4C4F5E),
      elevation: 1.0,
      constraints: ICON_CONSTRAINTS,
      shape: CircleBorder(),
      child: Icon(
        iconData,
        size: 20.0,
      ),

    );
  }
}

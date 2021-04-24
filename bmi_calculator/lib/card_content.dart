import 'package:flutter/material.dart';
import 'constants.dart';
const ICON_SIZE = 60.0;
const CARD_GAP = 10.0;


class CardContent extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;

  CardContent({this.cardIcon, this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: ICON_SIZE,
        ),
        SizedBox(
          height: CARD_GAP,
        ),
        Text(cardText,
          style:kTEXT_STYLE_CONST,
        )
      ],
    );
  }
}
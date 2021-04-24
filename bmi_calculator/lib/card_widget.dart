import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function tapHandler;

  CardWidget({this.color, this.cardChild,this.tapHandler});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapHandler,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
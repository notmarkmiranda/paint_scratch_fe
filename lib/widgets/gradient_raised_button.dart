import 'package:flutter/material.dart';

import 'package:paint_scratch_fe/config/colors.dart';

class GradientRaisedButton extends StatelessWidget {
  final String buttonText;
  final Color firstColor;
  final Color secondColor;
  final Color textColor;
  final Color borderColor;
  final Function onPressed;

  GradientRaisedButton(
      {this.buttonText,
      this.firstColor,
      this.secondColor,
      this.textColor = Colors.white,
      this.borderColor = Colors.black,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.all(8),
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: borderColor, width: 1),
        ),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [firstColor, secondColor],
              ),
              borderRadius: BorderRadius.circular(12.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

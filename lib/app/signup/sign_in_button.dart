import 'package:dwr0001/common_wiggets/custom_raised_button.dart';
import 'package:flutter/cupertino.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    String text,
    Color color,
    double height,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0),
          ),
          color: color,
          //borderRadius: 18.0,
          onPressed: onPressed,
          height: height,
        );
}

import 'package:flutter/material.dart';
import 'constants.dart';

class CustomCardChild extends StatelessWidget {
  final IconData customIcon;
  final String customText;
  CustomCardChild({this.customIcon, this.customText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          customIcon,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          customText,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}

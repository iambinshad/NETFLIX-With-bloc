import 'package:flutter/material.dart';

import '../../core/constant.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({Key? key, required this.icon, required this.text,this.iconSize=20,this.textSize=18})
      : super(key: key);
  final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        Text(
          text,
          style:  TextStyle(
            fontSize: textSize,
            color: kWhiteColor,
          ),
        )
      ],
    );
  }
}

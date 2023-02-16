import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/core/constant.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
        Spacer(),
        Icon(
          Icons.cast,
          size: 30,
          color: Colors.white,
        ),
        kWidth,
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        kWidth
      ],
    );
  }
}

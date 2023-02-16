
import 'package:flutter/material.dart';

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
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          size: 30,
          color: Colors.white,
        ),
        kWidth,
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
        ),
        kWidth
      ],
    );
  }
}

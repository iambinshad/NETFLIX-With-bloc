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
          style: const TextStyle(
              fontWeight: FontWeight.w900, fontSize: 30, fontFamily: 'Roboto'),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          size: 30,
          color: Colors.white,
        ),
        kWidth,
        Opacity(
          opacity: 0.7,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://static-cdn.jtvnw.net/jtv_user_pictures/1d8af5f8-03f8-4abb-ba09-93bcfe6895f6-profile_image-70x70.png')),
              color: Colors.blue,
            ),
          ),
        ),
        kWidth
      ],
    );
  }
}

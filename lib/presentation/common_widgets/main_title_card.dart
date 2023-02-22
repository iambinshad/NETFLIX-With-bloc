import 'package:flutter/material.dart';

import '../../core/constant.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({Key? key, required this.title, required this.posterList}) : super(key: key);
  final String title;
  final List<String> posterList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        kHeight,
        MainTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(posterList.length, (index) => MainCard(imageUrl: posterList[index]))),
        )
      ]),
    );
  }
}

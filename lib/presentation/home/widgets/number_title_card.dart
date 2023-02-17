import 'package:flutter/material.dart';

import '../../../core/constant.dart';
import '../../common_widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kHeight,
      const MainTitle(title: 'Top 10 Tv Shows In India Today'),
      kHeight,
      LimitedBox(
        maxHeight: 200,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => NumberCard(index: index))),
      )
    ]);
  }
}

import 'package:flutter/material.dart';

import '../../../core/constant.dart';
import '../../common_widgets/icon_with_text.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key, required this.bgUrl});
  final List<String> bgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      bgUrl[0]))),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const IconWithText(icon: Icons.add, text: 'My List'),
              playButton(),
              const IconWithText(icon: Icons.info_outline, text: 'Info')
            ],
          ),
        )
      ],
    );
  }

  TextButton playButton() {
    return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
      onPressed: () {},
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(
              fontSize: 18, color: kBlackColor, fontWeight: FontWeight.bold),
        ),
      ),
      icon: const Icon(
        Icons.play_arrow,
        color: kBlackColor,
        size: 20,
      ),
    );
  }
}

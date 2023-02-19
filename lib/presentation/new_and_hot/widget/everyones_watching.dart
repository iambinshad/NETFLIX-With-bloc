import 'package:flutter/material.dart';
import 'package:netflix/presentation/new_and_hot/widget/video_widget.dart';

import '../../../core/constant.dart';
import '../../common_widgets/icon_with_text.dart';

class EveryonesWatching extends StatelessWidget {
   final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatching({
    Key? key, required this.posterPath, required this.movieName, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kHeight,
      const Text(
        'Avatar',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Robobo',
            letterSpacing: 1.2),
      ),
      kHeight,
      const Text(
        "This hit sitcom follows the merry misadventures ofsix\n20-something pals as they navigate the pitfalls of\nwork,life and love in 1990s Mnahattan.",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
      ),
      const SizedBox(
        height: 35,
      ),
      VideoWidget(imgIndex: 0),
      kHeight,
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          IconWithText(
            icon: Icons.share,
            text: 'Share',
            textSize: 15,
            iconSize: 32,
          ),
          kWidth,
          IconWithText(
            icon: Icons.add,
            text: 'My List',
            textSize: 15,
            iconSize: 32,
          ),
          kWidth,
          IconWithText(
            icon: Icons.play_arrow,
            text: 'Play',
            textSize: 15,
            iconSize: 32,
          ),
          kWidth,
        ],
      )
    ]);
  }
}

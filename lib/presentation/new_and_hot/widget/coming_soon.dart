import 'package:flutter/material.dart';
import 'package:netflix/presentation/new_and_hot/widget/video_widget.dart';

import '../../../core/constant.dart';
import '../../common_widgets/icon_with_text.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kHeight,
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 500,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(month,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey)),
                Text(
                  day,
                  style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                )
              ]),
            ),
            SizedBox(
              width: size.width - 50,
              height: 500,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VideoWidget(posterPath, key),
                    kHeight,
                    kHeight,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            movieName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        const IconWithText(
                          icon: Icons.notifications_none,
                          text: 'Remind Me',
                          textSize: 14,
                        ),
                        kWidth,
                        const IconWithText(
                          icon: Icons.info_outlined,
                          text: 'Info',
                          textSize: 14,
                        ),
                        kWidth
                      ],
                    ),
                    kHeight,
                    Text(
                      'Coming on $day $month',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    kHeight,
                    Row(
                      children: const [
                        Image(
                          image: NetworkImage(
                            'https://assets.stickpng.com/thumbs/629764e87ec76b82fb21fce6.png',
                          ),
                          height: 30,
                          width: 30,
                        ),
                        Text(
                          'FILM',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    kHeight,
                    Text(
                      movieName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    kHeight,
                    Expanded(
                      child: Text(
                        description,
                        maxLines: 6,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}

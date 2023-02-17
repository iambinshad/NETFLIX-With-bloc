import 'package:flutter/material.dart';

import '../../../core/constant.dart';
import '../../common_widgets/icon_with_text.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('FEB',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey)),
                Text(
                  '11',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                )
              ]),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image(
                    image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/jHKNqz0LjM2dOUv5XDPmcSoYPEW.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_up_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            kHeight,
            kHeight,
            Row(
              children: const [
                Text(
                  'TALL GIRL 2',
                  style: TextStyle(
                      fontSize: 35, fontFamily: 'Pacifico', letterSpacing: -4),
                ),
                Spacer(),
                IconWithText(
                  icon: Icons.notifications_none,
                  text: 'Remind Me',
                  textSize: 14,
                ),
                kWidth,
                IconWithText(
                  icon: Icons.info_outlined,
                  text: 'Info',
                  textSize: 14,
                ),
                kWidth
              ],
            ),
            kHeight,
            const Text(
              'Coming on Friday',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
            const Text(
              'Tall Girl 2',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'Robobo',
                  letterSpacing: 1.2),
            ),
            kHeight,
            const Text(
              "Landing the lead in the school musical is a\ndream come true for jodi, until the pressure\nsends her confidence--and her relationship--\ninto a tailspin.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            )
          ]),
        ),
      ],
    );
  }
}
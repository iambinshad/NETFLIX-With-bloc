import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../../../core/constant.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var indexAddedOne = index + 1;
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 230,
              width: 30,
            ),
            Container(
              width: 150,
              height: 230,
              child: Image.network(imageUrl),
              decoration: BoxDecoration(
                  borderRadius: kborderradius,
                  ),
            ),
          ],
        ),
        Positioned(
          left: 3,
          bottom: -23,
          child: BorderedText(
            strokeWidth: 4.0,
            strokeColor: const Color.fromARGB(255, 208, 205, 205),
            child: Text("$indexAddedOne",
                style: const TextStyle(
                    fontSize: 130,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Robobto',
                    color: Colors.black)),
          ),
        )
      ],
    );
  }
}

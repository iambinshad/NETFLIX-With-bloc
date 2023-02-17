import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  VideoWidget({
    required this.imgIndex,
    Key? key,
  }) : super(key: key);
  final imgIndex;
  var img = [
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg',
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/jHKNqz0LjM2dOUv5XDPmcSoYPEW.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(img[imgIndex]),
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
    );
  }
}

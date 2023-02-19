import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
   String url;
  VideoWidget(
     this.url,
    Key? key,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          
          child: Image(
            image: NetworkImage(
              url,
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
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/constant.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 230,
      decoration: BoxDecoration(
          borderRadius:kborderradius,
          image: const DecorationImage(
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kuf6dutpsT0vSVehic3EZIqkOBt.jpg'))),
    );
  }
}

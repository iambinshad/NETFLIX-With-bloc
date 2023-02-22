import 'package:flutter/material.dart';


class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: 150,
      height: 230,
      child: Image.network(imageUrl),
    );
  }
}

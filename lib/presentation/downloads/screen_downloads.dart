import 'dart:math';

import 'package:flutter/material.dart';

import 'package:netflix/core/constant.dart';

import '../common_widgets/app_bar.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widget = [const SmartDownloads(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: AppBarWidget(
                  title: 'Downloads',
                )),
            body: ListView.separated(
                padding: const EdgeInsets.all(5),
                itemBuilder: (context, index) => _widget[index],
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: _widget.length)));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final _imageList = [
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/aNh4Q3iuPKDMPi2SL7GgOpiLukX.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Center(
          child: Text(
            'Indroducing Downloads for you',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "We'll download a personalised selection of\n     movies and shows for you, so there's\n      always something to watch on your\n                                 device.",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Color.fromARGB(255, 205, 201, 201)),
          ),
        ),
        SizedBox(
          height: size.width - 55,
          width: size.width - 55,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.4),
                radius: size.width * 0.36,
              ),
              DownloadsImageWidget(
                  size: Size(size.width * 0.33, size.width * 0.50),
                  angle: 23,
                  imageList: _imageList[0],
                  margin: const EdgeInsets.only(left: 170, bottom: 50)),
              DownloadsImageWidget(
                  angle: -23,
                  size: Size(size.width * 0.33, size.width * 0.50),
                  imageList: _imageList[1],
                  margin: const EdgeInsets.only(
                    right: 170,
                    bottom: 50,
                  )),
              DownloadsImageWidget(
                  size: Size(size.width * 0.40, size.width * 0.57),
                  imageList: _imageList[2],
                  margin: const EdgeInsets.only(
                    left: 0,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.blueAccent[700],
              onPressed: () {},
              child: const Text(
                'Set Up',
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 33, right: 33),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Colors.white,
            onPressed: () {},
            child: const Text(
              'See What You Can Download',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: const [
          kWidth,
          Icon(
            Icons.settings,
            color: kWhiteColor,
          ),
          kWidth,
          Text(
            'Smart Downloads',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          )
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      required String imageList,
      required this.margin,
      this.angle = 0,
      required this.size})
      : _imageList = imageList,
        super(key: key);

  final String _imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: kBlackColor,
            image: DecorationImage(
                image: NetworkImage(
                  _imageList,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}

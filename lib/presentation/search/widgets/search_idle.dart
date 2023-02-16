import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

import '../../../core/constant.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/eT9fTSTjsCCmdQJ62EpxvePGANc.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const SearchTextTitle(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const TopSearchItemTile(),
            separatorBuilder: (context, index) => kHeight,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.32,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image:const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kWidth,
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 24,
          child: Center(
            child: CircleAvatar(
              backgroundColor: kBlackColor,
              radius: 23,
              child: Icon(
                CupertinoIcons.play_fill,
                size: 24,
              ),
            ),
          ),
        )
      ],
    );
  }
}

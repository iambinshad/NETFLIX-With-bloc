import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';

import '../../core/constant.dart';
import '../common_widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            child: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, index, _) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: ((notification) {
                    final ScrollDirection direction = notification.direction;
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }
                    return true;
                  }),
                  child: Stack(children: [
                    ListView(
                      children: const [
                        BackgroundCard(),
                        MainTitleCard(title: 'Released in The Past Year '),
                        MainTitleCard(title: 'Trending Now'),

                        //seperated
                        NumberTitleCard(),

                        MainTitleCard(title: 'Tense Dramas'),
                        MainTitleCard(title: 'South Indian Cinema'),
                      ],
                    ),
                    scrollNotifier.value
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 2000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.1),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Image.network(
                                        'https://assets.stickpng.com/thumbs/629764e87ec76b82fb21fce6.png',
                                        width: 50,
                                        fit: BoxFit.cover,
                                        scale: 5.0,
                                        height: 50,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    kWidth,
                                    Opacity(
                                      opacity: 0.7,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://static-cdn.jtvnw.net/jtv_user_pictures/1d8af5f8-03f8-4abb-ba09-93bcfe6895f6-profile_image-70x70.png'))),
                                      ),
                                    ),
                                    kWidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'Tv Shows',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text('Movies',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      children: const [
                                        Text('Categories',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Icon(
                                          Icons.arrow_drop_down_sharp,
                                          color: kWhiteColor,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : const Text(''),
                  ]),
                );
              },
            )),
      ),
    );
  }
}

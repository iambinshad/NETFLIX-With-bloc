import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_page_bloc.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';

import '../../core/constant.dart';
import '../common_widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  int shuffleCount = 1;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomePageBloc>(context).add(const GetHomeScreenData());
    });
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
                    BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.hasError) {
                          return const Text('Error while getting data');
                        }
                        //released in the past year

                        final _releasedPastYear =
                            state.pastYearMovieList.map((m) {
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        //trending Now
                        final _trendingNow = state.trendingTvList.map((m) {
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        // top 10 tv shows in india today
                        final _topTenTvshow = state.trendingMovieList.map((m) {
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        //top10Movies
                        final _top10TvShow = state.trendingTvList.map((t) {
                          return '$imageAppendUrl${t.posterPath}';
                        }).toList();
                        _top10TvShow.shuffle();
                        // if (shuffleCount <= 1) {
                        //   _southIndianCinema.shuffle();
                        //   shuffleCount = shuffleCount + 1;
                        // }

                        //tensedrama
                        final _tenseDrama = state.tenseDramasMovieList.map((m) {
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();

                        //south India Cinema

                        final _southIndianCinema =
                            state.trendingTvList.map((m) {
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();

                        

                        //ListView
                        return ListView(
                          children: [
                            BackgroundCard(
                              bgUrl: _topTenTvshow,
                            ),
                            MainTitleCard(
                              title: 'Released in The Past Year ',
                              posterList: _releasedPastYear,
                            ),
                            MainTitleCard(
                                title: 'Trending Now',
                                posterList: _trendingNow),

                            //seperated
                            NumberTitleCard(
                              postersList: _top10TvShow,
                            ),

                            MainTitleCard(
                                title: 'Tense Dramas', posterList: _tenseDrama),
                            MainTitleCard(
                                title: 'South Indian Cinema',
                                posterList: _southIndianCinema),
                          ],
                        );
                      },
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
                                      padding: const EdgeInsets.only(top: 2),
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

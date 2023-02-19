import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/presentation/common_widgets/icon_with_text.dart';
import 'package:netflix/presentation/new_and_hot/widget/everyones_watching.dart';
import 'package:netflix/presentation/new_and_hot/widget/video_widget.dart';

import '../../core/constant.dart';
import 'widget/coming_soon.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  fontFamily: 'Roboto'),
            ),
            actions: const [
              Icon(
                Icons.cast,
                size: 30,
                color: Colors.white,
              ),
              kWidth,
              Opacity(
                  opacity: 0.7,
                  child: Image(
                      height: 30,
                      width: 30,
                      image: NetworkImage(
                          'https://static-cdn.jtvnw.net/jtv_user_pictures/1d8af5f8-03f8-4abb-ba09-93bcfe6895f6-profile_image-70x70.png'))),
              kWidth
            ],
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: kWhiteColor,
                unselectedLabelStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                labelColor: kBlackColor,
                labelStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    color: kWhiteColor, borderRadius: kborderradius30),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon     ',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching  ",
                  ),
                ]),
          ),
        ),
        body: TabBarView(children: [
          const ComingSoonList(key: Key('coming_soon')),
          _buildEveryOnesWatching(),
        ]),
      ),
    );
  }

  // Widget _buildComingSoon() {
  //   return ListView.builder(
  //       itemCount: 10,
  //       itemBuilder: (context, index) => const ComingSoonWidget());
  // }

  Widget _buildEveryOnesWatching() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => SizedBox(),
        // const EveryonesWatching(),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(child: Text('Error while getting data'));
        } else if (state.comingSoonList.isEmpty) {
          return const Center(child: Text('Coming soon list is empty'));
        } else {
          return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }

                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: 'March',
                  day: '22',
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? 'No discription',
                );
              });
        }
      },
    );
  }
}

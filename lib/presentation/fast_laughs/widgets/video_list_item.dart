import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fastlaugh_bloc.dart';

import 'package:netflix/core/constant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/downloads/models/downloads.dart';

class VideoListITemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListITemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(
          key: key,
          child: widget,
        );
  @override
  bool updateShouldNotify(covariant VideoListITemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListITemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListITemInheritedWidget>();
  }
}

class VideoListITem extends StatelessWidget {
  final int index;
  const VideoListITem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterpath =
        VideoListITemInheritedWidget.of(context)?.movieData.posterPath;
    final VideoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: VideoUrl, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.3),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_off_rounded),
                  ),
                ),

                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: posterpath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterpath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder: (BuildContext c, Set<int> newLikedListIds,
                          Widget? _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdsNotifier.value.remove(_index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: const VideoActionWidget(
                                icon: Icons.favorite, title: 'Liked'),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdsNotifier.value.add(_index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: const VideoActionWidget(
                                icon: Icons.emoji_emotions, title: 'LoL'),
                          );
                        }
                      },
                    ),
                    const VideoActionWidget(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                        onTap: () {
                          final movieName =
                              VideoListITemInheritedWidget.of(context)
                                  ?.movieData
                                  .title;
                          log(movieName.toString());
                          if (movieName != null) {
                            Share.share(movieName);
                          }
                        },
                        child: const VideoActionWidget(
                            icon: Icons.share, title: 'Share')),
                    const VideoActionWidget(
                        icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}

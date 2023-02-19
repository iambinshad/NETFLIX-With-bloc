import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fastlaugh_bloc.dart';
import 'package:netflix/presentation/fast_laughs/widgets/video_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastlaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastlaughBloc, FastlaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Error while getting data'),
              );
            } else if (state.videosList.isEmpty) {
              return const Center(child: Text('Error while getting data'));
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videosList.length, (index) {
                  return VideoListITemInheritedWidget(
                    widget: VideoListITem(
                      index: index,
                      key: Key(index.toString()),
                    ),
                    movieData: state.videosList[index],
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}

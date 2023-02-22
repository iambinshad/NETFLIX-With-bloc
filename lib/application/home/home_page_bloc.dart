import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new_res/hot_and_new_service.dart';

import '../../domain/hot_and_new_res/model/hot_and_new_res.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

part 'home_page_bloc.freezed.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HotAndNewService _homeService;
  
  HomePageBloc(this._homeService) : super((HomePageState.initial())) {
    // on event get homescreen data
    on<GetHomeScreenData>((event, emit) async {
      //send loading to Ui
      emit(
        state.copyWith(
          isLoading: true,
          hasError: false,
        ),
      );

      // get data

      final movieResult = await _homeService.getHotAndNewMovieData();
      final tvResult = await _homeService.getHotAndNewTvData();

      // transform data

      final state1 = movieResult.fold((MainFailure failure) {
        return  HomePageState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndinCinemaMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewRes res) {
        final pastYear = res.results;
        final trending = res.results;
        final dramas = res.results;
        final southIndian = res.results;
        pastYear.shuffle();
        trending.shuffle();
        dramas.shuffle();
        southIndian.shuffle();
        return HomePageState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: pastYear,
          trendingMovieList: trending,
          tenseDramasMovieList: dramas,
          southIndinCinemaMovieList: southIndian,
          trendingTvList: state.trendingTvList,
          isLoading: false,
          hasError: false,
        );
      });

      emit(state1);

      final state2 = tvResult.fold((MainFailure failure) {
        return  HomePageState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndinCinemaMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewRes res) {
        final top10List = res.results;
        return HomePageState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: top10List,
          tenseDramasMovieList: state.tenseDramasMovieList,
          southIndinCinemaMovieList: state.southIndinCinemaMovieList,
          trendingTvList: top10List,
          isLoading: false,
          hasError: false,
        );
      });

      // sent to Ui
      emit(state2);
    });
  }
}

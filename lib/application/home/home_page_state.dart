part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> tenseDramasMovieList,
    required List<HotAndNewData> southIndinCinemaMovieList,
    required List<HotAndNewData> trendingTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HomePageState.initial() => const HomePageState(
        stateId: '0',
        pastYearMovieList: [],
        trendingMovieList: [],
        tenseDramasMovieList: [],
        southIndinCinemaMovieList: [],
        trendingTvList: [],
        isLoading: false,
        hasError: false,
      );
}

part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
   factory HotAndNewState({
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyOnesWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotAndNewState.initial() =>
       HotAndNewState(comingSoonList: [], everyOnesWatchingList: [], hasError: false, isLoading: false);
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new_res/hot_and_new_service.dart';

import '../../domain/hot_and_new_res/model/hot_and_new_res.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get and new movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to Ui
      emit(
        HotAndNewState(
          comingSoonList: [],
          everyOnesWatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );

      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      //data to state
      final newState = _result.fold((MainFailure failure) {
        return HotAndNewState(
            comingSoonList: [],
            everyOnesWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewRes resp) {
        return HotAndNewState(
            comingSoonList: resp.results,
            everyOnesWatchingList: [],
            isLoading: false,
            hasError: true);
      });
      emit(newState);
    });
    //get and new tv data
    on<LoadDataInEveryOnesWatching>((event, emit) {});
  }
}

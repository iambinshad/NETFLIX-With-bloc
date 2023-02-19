import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/search/model/search_response/i_search_repo.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/model/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsRepo;
  final ISearchRepo _iSearchRepo;
  SearchBloc(
    this._downloadsRepo,
    this._iSearchRepo,
  ) : super(SearchState.initial()) {
/*
idle state
*/

    on<_Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: false,
          isError: false,
        ));
        return;
      }

      // get trending
      final _result = await _downloadsRepo.getDownloadsImage();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );

      // show to ui
      emit(_state);
    });

/*
search result state 
*/

    on<_SearchMovie>((event, emit) async {
      // call search movie api
      emit(SearchState(
        searchResultList: [],
        idleList: state.idleList,
        isLoading: true,
        isError: false,
      ));
      final _result =
          await _iSearchRepo.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MainFailure f) {
          const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResponse r) {
          return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );

      // show to ui
      emit(_state!);
    });
  }
}

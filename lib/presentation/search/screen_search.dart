import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';

import 'package:netflix/presentation/search/widgets/search_result.dart';

import '../../application/search/search_bloc.dart';
import '../../domain/core/debon/debounce_class.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _debouncer = Debouncer(milliseconds: 1 * 2000);
  GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<SearchBloc>(context)
            .add(const SearchEvent.initialize());
      },
    );
    return Scaffold(
      key: myFormKey,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.3),
              style: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                }
                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchEvent.searchMovie(movieQuery: value));
                });
              },
            ),
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return const SearchIdleWidget();
                } else {
                  return const SearchResultWidget();
                }
              },
            )),
          ],
        ),
      )),
    );
  }
}

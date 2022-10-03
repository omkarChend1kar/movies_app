import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/service/usecases/get_search_results_usecase.dart';
import 'package:movies_app/src/features/home/view/state/home_notifier.dart';
import 'package:movies_app/src/features/home/view/state/searchresults/search_results_notifier_state.dart';
import 'package:movies_app/src/features/home/view/state/topratedmovieslist/toprated_movies_notifier_state.dart';

class SearchResultsNotifierImpl
    extends StateNotifier<SearchResultsNotifierState>
    implements SearchResultsNotifier {
  ///
  final GetSearchResultsUsecase getSearchResultsUsecase;

  ///
  SearchResultsNotifierImpl({required this.getSearchResultsUsecase})
      : super(SearchResultsNotifierInitialState());
  emptySearchResults() {
    state = SearchResultsNotifierCompleteState(
      searchResults: [],
      page: 1,
    );
  }

  @override
  notifySearchResults(String? query) {
    ///
    final response = getSearchResultsUsecase(
      Params(
        query: query!,
        page: state is SearchResultsNotifierInitialState
            ? (state as SearchResultsNotifierInitialState).page
            : (state as SearchResultsNotifierCompleteState).page,
      ),
    );

    ///
    response!.then((value) {
      value.fold(
        (l) => SearchResultsNotifierErrorState(failures: l),
        (results) {
          state = SearchResultsNotifierCompleteState(
            page: state is SearchResultsNotifierInitialState
                ? (state as SearchResultsNotifierInitialState).page
                : (state as SearchResultsNotifierCompleteState).page + 1,
            searchResults: (state is SearchResultsNotifierInitialState)
                ? results
                : [
                    ...(state as SearchResultsNotifierCompleteState)
                        .searchResults,
                    ...results,
                  ],
          );
        },
      );
    });
  }
}

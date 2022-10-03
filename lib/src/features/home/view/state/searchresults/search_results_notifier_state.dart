import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';

///
abstract class SearchResultsNotifierState extends Equatable {}

///
class SearchResultsNotifierInitialState extends SearchResultsNotifierState {
  final List<dynamic> searchResults;
  final int page;

  SearchResultsNotifierInitialState({List<dynamic>? searchResults, int? page})
      : page = 1,
        searchResults = [];
  @override
  List<Object?> get props => [];
}

///
class SearchResultsNotifierCompleteState extends SearchResultsNotifierState {
  final List<dynamic> searchResults;
  final int page;

  SearchResultsNotifierCompleteState(
      {required this.searchResults, required this.page});

  SearchResultsNotifierCompleteState copyWith({
    List<dynamic>? searchResults,
    int? page,
  }) {
    return SearchResultsNotifierCompleteState(
      searchResults: searchResults ?? this.searchResults,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [searchResults, page];
}

///
class SearchResultsNotifierErrorState extends SearchResultsNotifierState {
  final Failures failures;

  SearchResultsNotifierErrorState({required this.failures});
  @override
  List<Object?> get props => [failures];
}

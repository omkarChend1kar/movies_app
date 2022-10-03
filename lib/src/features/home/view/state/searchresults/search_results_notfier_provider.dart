import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';
import 'package:movies_app/src/features/home/view/state/searchresults/search_results_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/searchresults/search_results_notifier_state.dart';

final searchResultsNotifierProvider = StateNotifierProvider<
    SearchResultsNotifierImpl, SearchResultsNotifierState>(
  (ref) => sl<SearchResultsNotifierImpl>(),
);

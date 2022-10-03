import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/view/state/populartvshowslist/popular_tv_shows_notifier_provider.dart';
import 'package:movies_app/src/features/home/view/state/populartvshowslist/popular_tv_shows_notifier_state.dart';
import 'package:movies_app/src/features/home/view/state/searchresults/search_results_notfier_provider.dart';
import 'package:movies_app/src/features/home/view/state/searchresults/search_results_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/searchresults/search_results_notifier_state.dart';
import 'package:movies_app/src/features/home/view/widgets/build_poster_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/build_search_bar.dart';

class SearchPage extends HookWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    final textEditingController = useTextEditingController();

    ///
    final isSearched = useState(false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.deepOrangeAccent,
            size: 30,
          ),
        ),
      ),
      body: ListView(
        children: [
          buildSearchBar(textEditingController, isSearched),
          isSearched.value
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Search results for ..${textEditingController.text}',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const SizedBox(),
          !isSearched.value
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Search movies and Tv shows..',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          SearchResultsWidget(
            query: textEditingController.text,
          )
        ],
      ),
    );
  }
}

class SearchResultsWidget extends ConsumerWidget {
  const SearchResultsWidget({required this.query, super.key});
  final String query;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    final state = ref.watch(searchResultsNotifierProvider);

    ///
    if (state is SearchResultsNotifierInitialState) {}

    ///
    if (state is SearchResultsNotifierCompleteState) {
      ///
      final List<dynamic> searchResults = state.searchResults;

      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 3.3,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                ///
                final before = notification.metrics.extentBefore;

                ///
                final max = notification.metrics.maxScrollExtent;
                if (before == max) {
                  sl<SearchResultsNotifierImpl>().notifySearchResults(query);
                  return true;
                }
                return false;
              }
              return false;
            },
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchResults.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 2.2 / 3,
              ),
              itemBuilder: (context, index) {
                ///
                final media = searchResults[index];

                ///
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: buildPosterWidget(
                    posterPath: media.posterPath ?? '',
                    backdroppath: media.backdropPath ?? '',
                    tv: media is TvEntity ? media : null,
                    movie: media is MovieEntity ? media : null,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    ///
    if (state is SearchResultsNotifierErrorState) {
      return Text(state.failures.message!);
    }
    return const SizedBox();
  }
}

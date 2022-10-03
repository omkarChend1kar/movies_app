import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/view/state/topratedmovieslist/toprated_movies_notifier_provider.dart';
import 'package:movies_app/src/features/home/view/state/topratedmovieslist/toprated_movies_notifier_state.dart';
import 'package:movies_app/src/features/home/view/widgets/build_poster_widget.dart';

class TopRatedMoviesListWidget extends ConsumerWidget {
  const TopRatedMoviesListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    final state = ref.watch(topRatedMoviesNotifierProvider);

    ///
    if (state is TopRatedMoviesNotifierInitialState) {}

    ///
    if (state is TopRatedMoviesNotifierCompleteState) {
      ///
      final listOfMovies = state.topRatedMovies;

      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 3.3,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listOfMovies.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 2.2 / 3,
            ),
            itemBuilder: (context, index) {
              ///
              final movie = listOfMovies[index];

              ///
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: buildPosterWidget(
                  posterPath: movie.posterPath!,
                  backdroppath: movie.backdropPath!,
                  movie: movie
                ),
              );
            },
          ),
        ),
      );
    }

    ///
    if (state is TopRatedMoviesNotifierErrorState) {
      //TODO : Need to work on error widget
    }
    return const SizedBox();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/view/pages/movies_details_page.dart';
import 'package:movies_app/src/features/home/view/state/upcomingmovieslist/upcoming_movies_notifier_provider.dart';
import 'package:movies_app/src/features/home/view/state/upcomingmovieslist/upcoming_movies_notifier_state.dart';
import 'package:movies_app/src/features/home/view/widgets/build_poster_widget.dart';

class UpcomingMoviesListWidget extends ConsumerWidget {
  const UpcomingMoviesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    final state = ref.watch(upcomingMoviesNotifierProvider);

    ///
    if (state is UpcomingMoviesNotifierInitialState) {
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 250,
              maxWidth: 150,
            ),
            child: Lottie.asset(
              'assets/animation/load-shimmer.json',
              fit: BoxFit.fill,
            ),
          );
        },
      );
    }

    ///
    if (state is UpcomingMoviesNotifierCompleteState) {
      ///
      final List<MovieEntity> upcomingMovies = state.upcomingMovies;

      return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Upcoming movies',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 250,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.upcomingMovies.length,
                  itemBuilder: (context, index) {
                    ///
                    final movie = upcomingMovies[index];

                    ///
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildPosterWidget(
                        posterPath: movie.posterPath!,
                        backdroppath: movie.backdropPath!,
                        movie: movie,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    ///
    if (state is UpcomingMoviesNotifierErrorState) {
      return Text(state.failures.message!);
    }
    return const SizedBox();
  }
}

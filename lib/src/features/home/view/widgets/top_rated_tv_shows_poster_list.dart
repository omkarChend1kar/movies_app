import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/view/state/topratedtvshowslist/toprated_tv_shows_notfier_state.dart';
import 'package:movies_app/src/features/home/view/state/topratedtvshowslist/toprated_tv_shows_notifier_provider.dart';
import 'package:movies_app/src/features/home/view/widgets/build_poster_widget.dart';

class TopRatedTvShowsListWidget extends ConsumerWidget {
  const TopRatedTvShowsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    final state = ref.watch(topRatedTvShowsNotifierProvider);

    ///
    if (state is TopRatedTvShowsNotifierInitialState) {}

    ///
    if (state is TopRatedTvShowsNotifierCompleteState) {
      ///
      final List<TvEntity> topRatedTvShows = state.topRatedTvShows;

      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 3.3,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: topRatedTvShows.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 2.2 / 3,
            ),
            itemBuilder: (context, index) {
              ///
              final tvShow = topRatedTvShows[index];

              ///
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: buildPosterWidget(
                  posterPath: tvShow.posterPath!,
                  backdroppath: tvShow.backdropPath!,
                  tv: tvShow
                ),
              );
            },
          ),
        ),
      );
    }

    ///
    if (state is TopRatedTvShowsNotifierErrorState) {
      return Text(state.failures.message!);
    }
    return const SizedBox();
  }
}

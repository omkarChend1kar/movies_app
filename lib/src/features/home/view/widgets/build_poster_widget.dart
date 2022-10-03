import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';
import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/view/pages/movies_details_page.dart';
import 'package:movies_app/src/features/home/view/pages/tv_shows_details_page.dart';
import 'package:movies_app/src/features/home/view/state/backdroppath/backdroppath_provider.dart';
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_provider.dart';
import 'package:movies_app/src/features/home/view/widgets/build_poster_image.dart';

Widget buildPosterWidget({
  required String posterPath,
  required String backdroppath,
  MovieEntity? movie,
  TvEntity? tv,
}) {
  return Consumer(
    builder: (context, ref, child) {
      ///
      final posterUrl = 'https://image.tmdb.org/t/p/original/$posterPath';

      ///
      return InkWell(
        onTap: () {
          ///
          ref
              .read(backdroppathProvider.notifier)
              .update((state) => state = backdroppath);

          ///
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              if (movie != null) {
                return MoviesDetailsPage(movie: movie);
              } else {
                return TvShowDetailsPage(tvShow: tv!);
              }
            },
          ));

          ///
          if (movie != null) {
            // print(movie.id);
            // ref.read(creditsNotifierProvider.notifier).notifyCreditsEntityListForMovies(movie.id);
            sl<CreditsListNotifierImpl>()
                .notifyCreditsEntityListForMovies(movie.id);
          } else {
            sl<CreditsListNotifierImpl>().notifyCreditsEntityListForTv(tv!.id);
          }
        },
        child: buildPosterImage(posterUrl),
      );
    },
  );
}

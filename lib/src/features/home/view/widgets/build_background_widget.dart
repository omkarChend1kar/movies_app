import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/view/state/backdroppath/backdroppath_provider.dart';
import 'package:movies_app/src/features/home/view/state/upcomingmovieslist/upcoming_movies_notifier_provider.dart';
import 'package:movies_app/src/features/home/view/state/upcomingmovieslist/upcoming_movies_notifier_state.dart';

Widget buildBackgroundWidget(BuildContext context) {
  return Consumer(
    builder: (context, ref, child) {
      ///
      ref.listen(upcomingMoviesNotifierProvider, (previous, next) {
        if (next is UpcomingMoviesNotifierCompleteState) {
          ref.read(backdroppathProvider.notifier).update((state) {
            return state = next.upcomingMovies.first.backdropPath!;
          });
        }
      });

      ///
      final backdroppath = ref.watch(backdroppathProvider);

      ///
      final imageUrl = 'https://image.tmdb.org/t/p/original/$backdroppath';
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageUrl,
            ),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
        ),
      );
    },
  );
}

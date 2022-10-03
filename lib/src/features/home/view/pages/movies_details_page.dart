import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_provider.dart';
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_state.dart';
import 'package:movies_app/src/features/home/view/widgets/build_back_button_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/build_overview_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/build_poster_for_details_page.dart';

class MoviesDetailsPage extends StatelessWidget {
  const MoviesDetailsPage({super.key, required this.movie});

  static const String route = '/moviedetails';

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    ///
    final posterUrl = 'https://image.tmdb.org/t/p/original/${movie.posterPath}';

    ///
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          buildPosterForDetails(context, posterUrl),
          buildBackButtonWidget(context),
          buildOverviewWidget(
            context: context,
            title: movie.originalTitle!,
            overview: movie.overview!,
          ),
        ],
      ),
    );
  }
}

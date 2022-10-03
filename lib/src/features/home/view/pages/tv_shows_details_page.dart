import 'package:flutter/material.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/view/widgets/build_back_button_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/build_overview_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/build_poster_for_details_page.dart';

class TvShowDetailsPage extends StatelessWidget {
  const TvShowDetailsPage({super.key, required this.tvShow});
  final TvEntity tvShow;

  @override
  Widget build(BuildContext context) {
    ///
    final posterUrl = 'https://image.tmdb.org/t/p/original/${tvShow.posterPath}';

    ///
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          buildPosterForDetails(context, posterUrl),
          buildBackButtonWidget(context),
          buildOverviewWidget(
            context: context,
            title: tvShow.originalTitle!,
            overview: tvShow.overview!,
          ),
        ],
      ),
    );
  }
}

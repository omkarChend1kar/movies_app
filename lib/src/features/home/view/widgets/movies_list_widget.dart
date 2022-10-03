import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/src/features/home/view/widgets/bottom_panel_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/popular_movies_poster_list_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/top_rated_movies_poster_list_widget.dart';

class MoviesListWidget extends HookConsumerWidget {
  const MoviesListWidget({super.key, required this.category});
  final ValueNotifier<Category> category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (category.value == Category.popular) {
      return const PopularMoviesListWidget();
    } else {
      return const TopRatedMoviesListWidget();
    }
  }
}
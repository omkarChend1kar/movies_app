import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/src/features/home/view/state/backdroppath/category_provider.dart';
import 'package:movies_app/src/features/home/view/state/mediatype/media_type_provider.dart';
import 'package:movies_app/src/features/home/view/widgets/build_buttons_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/movies_list_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/popular_tv_shows_poster_list_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/top_rated_tv_shows_poster_list.dart';

///
enum MediaType { movie, tv }

///
enum Category { popular, toprated }

class BottomPanelWidget extends HookWidget {
  const BottomPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    final mediaType = useState(MediaType.movie);

    ///
    final category = useState(Category.popular);

    ///
    return Column(
      children: [
        BuildButtonsWidget(mediaType: mediaType, category: category),
        mediaType.value == MediaType.movie
            ? MoviesListWidget(category: category)
            : TvShowsListWidget(category: category),
      ],
    );
  }
}

class TvShowsListWidget extends HookConsumerWidget {
  const TvShowsListWidget({required this.category, super.key});
  final ValueNotifier<Category> category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (category.value == Category.popular) {
      return const PopulatTvShowsListWidget();
    } else {
      return const TopRatedTvShowsListWidget();
    }
  }
}

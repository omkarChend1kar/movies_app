///[Marker Interface] abstraction for all the home notifiers
abstract class HomeNotifier {}

abstract class UpcomingMoviesNotifier extends HomeNotifier {
  notifyMovieEntityList();
}

abstract class PopularMoviesNotifier extends HomeNotifier {
  notifyMovieEntityList();
}

abstract class TopRatedMoviesNotifier extends HomeNotifier {
  notifyMovieEntityList();
}

abstract class PopularTvShowsNotifier extends HomeNotifier {
  notifyTvEntityList();
}

abstract class TopRatedTvShowsNotifier extends HomeNotifier {
  notifyTvEntityList();
}

abstract class SimilarTvShowsNotifier extends HomeNotifier {
  notifyTvEntityList(int? id);
}

abstract class CreditsNotifier extends HomeNotifier {
  ///
  notifyCreditsEntityListForMovies(int? id);

  ///
  notifyCreditsEntityListForTv(int? id);
}

abstract class SearchResultsNotifier extends HomeNotifier {
  notifySearchResults(String? query);
}

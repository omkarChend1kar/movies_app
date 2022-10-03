import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_app/src/core/utill/network/network_info.dart';
import 'package:movies_app/src/features/home/data/datasources/home_remote_datasource.dart';
import 'package:movies_app/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_credits_for_movie_usecase.dart';
import 'package:movies_app/src/features/home/service/usecases/get_credits_for_tv_usecase.dart';
import 'package:movies_app/src/features/home/service/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/src/features/home/service/usecases/get_popular_tv_shows_usecase.dart';
import 'package:movies_app/src/features/home/service/usecases/get_search_results_usecase.dart';
import 'package:movies_app/src/features/home/service/usecases/get_similar_tv_shows_usecase.dart';
import 'package:movies_app/src/features/home/service/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/src/features/home/service/usecases/get_top_rated_tv_shows_usecase.dart';
import 'package:movies_app/src/features/home/service/usecases/get_upoming_movies_usecase.dart';
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/home_notifier.dart';
import 'package:movies_app/src/features/home/view/state/popularmovieslist/popular_movies_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/populartvshowslist/popular_tv_shows_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/searchresults/search_results_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/similartvshowslist/similar_tv_shows_notfier_impl.dart';
import 'package:movies_app/src/features/home/view/state/topratedmovieslist/toprated_movies_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/topratedtvshowslist/toprated_tv_shows_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/upcomingmovieslist/upcoming_movies_notifier_impl.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  ///Notifier Implementations
  ///1
  sl.registerLazySingleton<PopularMoviesNotifierImpl>(
    () => PopularMoviesNotifierImpl(
      getPopularMoviesUsecase: sl(),
    ),
  );

  ///2
  sl.registerLazySingleton<TopRatedMoviesNotifierImpl>(
    () => TopRatedMoviesNotifierImpl(
      getTopRatedMoviesUsecase: sl(),
    ),
  );

  ///3
  sl.registerLazySingleton<UpcomingMoviesNotifierImpl>(
    () => UpcomingMoviesNotifierImpl(
      getUpcomingMoviesUsecase: sl(),
    ),
  );

  ///4
  sl.registerLazySingleton<PopularTvShowsNotifierImpl>(
    () => PopularTvShowsNotifierImpl(
      getPopularTvShowsUsecase: sl(),
    ),
  );

  ///5
  sl.registerLazySingleton<TopRatedTvShowsNotifierImpl>(
    () => TopRatedTvShowsNotifierImpl(
      getTopRatedTvShowsUsecase: sl(),
    ),
  );

  ///6
  sl.registerLazySingleton<SimilarTvShowsNotifierImpl>(
    () => SimilarTvShowsNotifierImpl(
      getSimilarTvShowsUsecase: sl(),
    ),
  );

  ///7
  sl.registerLazySingleton<CreditsListNotifierImpl>(
    () => CreditsListNotifierImpl(
      getCreditsForTvUsecase: sl(),
      getCreditsForMovieUsecase: sl(),
    ),
  );

  ///8
  sl.registerLazySingleton<SearchResultsNotifierImpl>(
    () => SearchResultsNotifierImpl(
      getSearchResultsUsecase: sl(),
    ),
  );

  ///Usecases
  ///1
  sl.registerLazySingleton<GetPopularMoviesUsecase>(
    () => GetPopularMoviesUsecaseImpl(
      repository: sl(),
    ),
  );

  ///2
  sl.registerLazySingleton<GetTopRatedMoviesUsecase>(
    () => GetTopRatedMoviesUsecaseImpl(
      repository: sl(),
    ),
  );

  ///3
  sl.registerLazySingleton<GetUpcomingMoviesUsecase>(
    () => GetUpcomingMoviesUsecaseImpl(
      repository: sl(),
    ),
  );

  ///4
  sl.registerLazySingleton<GetPopularTvShowsUsecase>(
    () => GetPopularTvShowsUsecaseImpl(
      repository: sl(),
    ),
  );

  ///5
  sl.registerLazySingleton<GetTopRatedTvShowsUsecase>(
    () => GetTopRatedTvShowsUsecaseImpl(
      repository: sl(),
    ),
  );

  ///6
  sl.registerLazySingleton<GetSimilarTvShowsUsecase>(
    () => GetSimilarTvShowsUsecaseImpl(
      repository: sl(),
    ),
  );

  ///7
  sl.registerLazySingleton<GetCreditsForMovieUsecase>(
    () => GetCreditsForMovieUsecaseImpl(
      repository: sl(),
    ),
  );

  ///8
  sl.registerLazySingleton<GetCreditsForTvUsecase>(
    () => GetCreditsForTvUsecaseImpl(
      repository: sl(),
    ),
  );

  ///9
  sl.registerLazySingleton<GetSearchResultsUsecase>(
    () => GetSearchResultsUsecaseImpl(
      repository: sl(),
    ),
  );

  ///Repository Implementations
  ///1
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  ///Datasource
  sl.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(
      httpClient: sl(),
    ),
  );

  ///External
  ///1
  sl.registerLazySingleton(
    () => http.Client(),
  );

  ///2
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );

  ///3
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

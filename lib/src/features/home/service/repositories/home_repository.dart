import 'package:dartz/dartz.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';

abstract class HomeRepository {
  ///
  Future<Either<Failures, List<MovieEntity>>>? getPopularMovies({int page = 1});

  ///
  Future<Either<Failures, List<MovieEntity>>>? getUpcomingMovies({int page = 1});

  ///
  Future<Either<Failures, List<MovieEntity>>>? getTopRatedMovies(
      {int page = 1});

  ///
  Future<Either<Failures, List<TvEntity>>>? getPopularTvShows({int page = 1});

  ///
  Future<Either<Failures, List<TvEntity>>>? getSimilarTvShows(int id,
      {int page = 1});

  ///
  Future<Either<Failures, List<TvEntity>>>? getTopRatedTvShows({int page = 1});

  ///
  Future<Either<Failures, List<dynamic>>>? getSearchResults(
      {required String query, int page = 1});

  ///
  Future<Either<Failures, List<CreditsEntity>>>? getCreditsForMovie(int id,
      {int page = 1});

  ///
  Future<Either<Failures, List<CreditsEntity>>>? getCreditsForTv(int id,
      {int page = 1});
}

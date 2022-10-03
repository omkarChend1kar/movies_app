import 'package:movies_app/src/core/utill/error/exceptions.dart';
import 'package:movies_app/src/core/utill/network/network_info.dart';
import 'package:movies_app/src/features/home/data/datasources/home_remote_datasource.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDatasource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failures, List<CreditsEntity>>>? getCreditsForMovie(int id,
      {int page = 1}) async {
    if (await networkInfo.isConnected!) {
      try {
        final listOfCredits =
            await remoteDatasource.getCreditsForMovie(id, page: page);
        return Right(listOfCredits!);
      } on ServerException {
        return const Left(
            ServerFailure(message: 'Request failed to get credits for Movie'));
      }
    } else {
      return const Left(NetworFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failures, List<CreditsEntity>>>? getCreditsForTv(int id,
      {int page = 1}) async {
    if (await networkInfo.isConnected!) {
      try {
        final listOfCredits =
            await remoteDatasource.getCreditsForTv(id, page: page);
        return Right(listOfCredits!);
      } on ServerException {
        return const Left(ServerFailure(
            message: 'Request failed to get credits for Tv show'));
      }
    } else {
      return const Left(NetworFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failures, List<MovieEntity>>>? getUpcomingMovies(
      {int page = 1}) async {
    if (await networkInfo.isConnected!) {
      try {
        final listOfMovies = await remoteDatasource.getLatestMovies(page: page);
        return Right(listOfMovies!);
      } on ServerException {
        return const Left(
          ServerFailure(message: 'Request failed to get latest movies'),
        );
      }
    } else {
      return const Left(NetworFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failures, List<TvEntity>>>? getSimilarTvShows(int id,
      {int page = 1}) async {
    if (await networkInfo.isConnected!) {
      try {
        final listOfTvShows =
            await remoteDatasource.getSimilarTvShows(id, page: page);
        return Right(listOfTvShows!);
      } on ServerException {
        return const Left(
          ServerFailure(message: 'Request failed to get latest tv shows'),
        );
      }
    } else {
      return const Left(NetworFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failures, List<MovieEntity>>>? getPopularMovies(
      {int page = 1}) async {
    if (await networkInfo.isConnected!) {
      try {
        final listOfMovies =
            await remoteDatasource.getPopularMovies(page: page);
        return Right(listOfMovies!);
      } on ServerException {
        return const Left(
          ServerFailure(message: 'Request failed to get popular movies'),
        );
      }
    } else {
      return const Left(NetworFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failures, List<TvEntity>>>? getPopularTvShows(
      {int page = 1}) async {
    if (await networkInfo.isConnected!) {
      try {
        final listOfTvShows =
            await remoteDatasource.getPopularTvShows(page: page);
        return Right(listOfTvShows!);
      } on ServerException {
        return const Left(
          ServerFailure(message: 'Request failed to get popular tv shows'),
        );
      }
    } else {
      return const Left(NetworFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failures, List>>? getSearchResults(
      {required String query, int page = 1}) async {
    if (await networkInfo.isConnected!) {
      try {
        final searchResults =
            await remoteDatasource.getSearchResults(page: page, query: query);
        return Right(searchResults!);
      } on ServerException {
        return const Left(
          ServerFailure(message: 'Request failed to get search results'),
        );
      }
    } else {
      return const Left(NetworFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failures, List<MovieEntity>>>? getTopRatedMovies(
      {int page = 1}) async {
    if (await networkInfo.isConnected!) {
      try {
        final listOfMovies =
            await remoteDatasource.getTopRatedMovies(page: page);
        return Right(listOfMovies!);
      } on ServerException {
        return const Left(
          ServerFailure(message: 'Request failed to get top rated movies'),
        );
      }
    } else {
      return const Left(NetworFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failures, List<TvEntity>>>? getTopRatedTvShows(
      {int page = 1}) async {
    if (await networkInfo.isConnected!) {
      try {
        final listOfTvShows =
            await remoteDatasource.getTopRatedTvShows(page: page);
        return Right(listOfTvShows!);
      } on ServerException {
        return const Left(
          ServerFailure(message: 'Request failed to get latest tv shows'),
        );
      }
    } else {
      return const Left(NetworFailure(message: 'No internet connection'));
    }
  }
}

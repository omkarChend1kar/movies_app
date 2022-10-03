import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_top_rated_movies_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  GetTopRatedMoviesUsecaseImpl? getTopRatedMovies;
  MockHomeRepository? mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getTopRatedMovies =
        GetTopRatedMoviesUsecaseImpl(repository: mockHomeRepository!);
  });

  final List<MovieEntity> topRatedMovies = [
        const MovieEntity(
      id: 1,
      genres: [],
      posterPath: 'posterPath',
      overview: 'overview',
      releaseDate: 'releaseDate',
      originalTitle: 'originalTitle',
      originalLanguage: 'originalLanguage',
      backdropPath: 'backdropPath',
      popularity: 1,
      voteCount: 1,
    ),
    const MovieEntity(
      id: 1,
      genres: [],
      posterPath: 'posterPath',
      overview: 'overview',
      releaseDate: 'releaseDate',
      originalTitle: 'originalTitle',
      originalLanguage: 'originalLanguage',
      backdropPath: 'backdropPath',
      popularity: 1,
      voteCount: 1,
    ),
  ];

  test('should get list of top rated movies from repository', () async {
    ///arrange
    when(mockHomeRepository!.getTopRatedMovies())
        .thenAnswer((_) async => Future(() => Right(topRatedMovies)));

    ///act
    final result = await getTopRatedMovies!(const Params(page: null));

    ///assert
    expect(result, Right(topRatedMovies));
    verify(mockHomeRepository!.getTopRatedMovies());
  });
}

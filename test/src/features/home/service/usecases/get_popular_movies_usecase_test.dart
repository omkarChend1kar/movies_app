import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_popular_movies_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  GetPopularMoviesUsecaseImpl? getPopularMovies;
  MockHomeRepository? mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getPopularMovies =
        GetPopularMoviesUsecaseImpl(repository: mockHomeRepository!);
  });

  final List<MovieEntity> popularMovies = [
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

  test('should get list of popular movies from repository', () async {
    ///arrange
    when(mockHomeRepository!.getPopularMovies())
        .thenAnswer((_) async => Future(() => Right(popularMovies)));

    ///act
    final result = await getPopularMovies!(const Params(page: null));

    ///assert
    expect(result, Right(popularMovies));
    verify(mockHomeRepository!.getPopularMovies());
  });
}

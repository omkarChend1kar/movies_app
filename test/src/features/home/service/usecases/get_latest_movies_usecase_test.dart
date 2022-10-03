import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_upoming_movies_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  GetUpcomingMoviesUsecaseImpl? getUpcomingMovies;
  MockHomeRepository? mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getUpcomingMovies =
        GetUpcomingMoviesUsecaseImpl(repository: mockHomeRepository!);
  });

  final List<MovieEntity> latestMovies = [
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

  test('should get list of latest movies from repository', () async {
    ///arrange
    when(mockHomeRepository!.getUpcomingMovies())
        .thenAnswer((_) async => Future(() => Right(latestMovies)));

    ///act
    final result = await getUpcomingMovies!(const Params(page: null));

    ///assert
    expect(result, Right(latestMovies));
    verify(mockHomeRepository!.getUpcomingMovies());
  });
}

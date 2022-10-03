import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_similar_tv_shows_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  GetSimilarTvShowsUsecaseImpl? getSimilarTvShows;
  MockHomeRepository? mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getSimilarTvShows =
        GetSimilarTvShowsUsecaseImpl(repository: mockHomeRepository!);
  });

  final List<TvEntity> latestTvShows = [
    const TvEntity(
      originCountry: [],
      id: 1,
      genres: [],
      posterPath: 'posterPath',
      overview: 'overview',
      firstAirDate: 'firstAirDate',
      originalTitle: 'originalTitle',
      originalLanguage: 'originalLanguage',
      backdropPath: 'backdropPath',
      popularity: 1,
      voteCount: 1,
    ),
    const TvEntity(
      originCountry: [],
      id: 1,
      genres: [],
      posterPath: 'posterPath',
      overview: 'overview',
      firstAirDate: 'firstAirDate',
      originalTitle: 'originalTitle',
      originalLanguage: 'originalLanguage',
      backdropPath: 'backdropPath',
      popularity: 1,
      voteCount: 1,
    ),
  ];

  test('should get list of latest tv shows from repository', () async {
    ///arrange
    when(mockHomeRepository!.getSimilarTvShows(1))
        .thenAnswer((_) async => Future(() => Right(latestTvShows)));

    ///act
    final result = await getSimilarTvShows!(const Params(1));

    ///assert
    expect(result, Right(latestTvShows));
    verify(mockHomeRepository!.getSimilarTvShows(1));
  });
}

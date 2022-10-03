import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_top_rated_tv_shows_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  GetTopRatedTvShowsUsecaseImpl? getTopRatedTvShows;
  MockHomeRepository? mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getTopRatedTvShows =
        GetTopRatedTvShowsUsecaseImpl(repository: mockHomeRepository!);
  });

  final List<TvEntity> topRatedTvShows = [
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

  test('should get list of top rated tv shows from repository', () async {
    ///arrange
    when(mockHomeRepository!.getTopRatedTvShows())
        .thenAnswer((_) async => Future(() => Right(topRatedTvShows)));

    ///act
    final result = await getTopRatedTvShows!(const Params());

    ///assert
    expect(result, Right(topRatedTvShows));
    verify(mockHomeRepository!.getTopRatedTvShows());
  });
}

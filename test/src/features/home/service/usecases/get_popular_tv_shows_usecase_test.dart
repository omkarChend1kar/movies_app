import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_popular_tv_shows_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  GetPopularTvShowsUsecaseImpl? getPopularTvShows;
  MockHomeRepository? mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getPopularTvShows =
        GetPopularTvShowsUsecaseImpl(repository: mockHomeRepository!);
  });

  final List<TvEntity> popularTvShows = [
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

  test('should get list of popular tv shows from repository', () async {
    ///arrange
    when(mockHomeRepository!.getPopularTvShows())
        .thenAnswer((_) async => Future(() => Right(popularTvShows)));

    ///act
    final result = await getPopularTvShows!(const Params());

    ///assert
    expect(result, Right(popularTvShows));
    verify(mockHomeRepository!.getPopularTvShows());
  });
}

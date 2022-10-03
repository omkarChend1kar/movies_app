import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';

import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_search_results_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  GetSearchResultsUsecaseImpl? getSearchResults;
  MockHomeRepository? mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getSearchResults =
        GetSearchResultsUsecaseImpl(repository: mockHomeRepository!);
  });

  final List<dynamic> searchResults = [
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

  test('should get list of search results for movies and tv shows from repository', () async {
    ///arrange
    when(mockHomeRepository!.getSearchResults(query: 'query'))
        .thenAnswer((_) async => Future(() => Right(searchResults)));

    ///act
    final result = await getSearchResults!(const Params(query: 'query'));

    ///assert
    expect(result, Right(searchResults));
    verify(mockHomeRepository!.getSearchResults(query: 'query'));
  });
}

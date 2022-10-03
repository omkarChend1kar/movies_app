import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:movies_app/src/core/utill/error/exceptions.dart';
import 'package:movies_app/src/features/home/data/models/credits_entity_model.dart';
import 'package:movies_app/src/features/home/data/models/movie_entity_model.dart';
import 'package:movies_app/src/features/home/data/models/tv_entity_model.dart';
import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import '../../../fixtures/fixture_reader.dart';
import 'package:movies_app/src/features/home/data/datasources/home_remote_datasource.dart';
import 'package:mockito/annotations.dart';
import 'home_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  HomeRemoteDatasourceImpl? homeRemoteDatasourceImpl;
  http.Client? mockClient;

  setUp(() {
    mockClient = MockClient();
    homeRemoteDatasourceImpl = HomeRemoteDatasourceImpl(
      httpClient: mockClient!,
    );
  });
  final List<CreditsEntity> listOfCredits = [
    const CreditsEntityModel(
      originalName: 'Edward Norton',
      characterName: 'The Narrator',
      profilePath: '/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg',
    ),
    const CreditsEntityModel(
      originalName: 'Brad Pitt',
      characterName: 'Tyler Durden',
      profilePath: '/cckcYc2v0yh1tc9QjRelptcOBko.jpg',
    ),
  ];
  test(
      'should perform GET request on a URL with movie id being an endpoint and header as',
      () async {
    ///arrange
    // final mockHttpClient = MockClient();
    const int movieId = 550;
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    when(
      mockClient!.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json;charset=utf-8'
        },
      ),
    ).thenAnswer(
      (_) => Future(
        () => http.Response(fixture('list_of_credits_response.json'), 200),
      ),
    );

    ///act
    homeRemoteDatasourceImpl!.getCreditsForMovie(movieId);

    ///assert
    verify(
      mockClient!.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json;charset=utf-8'
        },
      ),
    );
  });
  test('should return list of [CreditsEntity] when the response code is 200',
      () async {
    ///arrange
    const int movieId = 550;
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    when(
      mockClient!.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json;charset=utf-8'
        },
      ),
    ).thenAnswer(
      (_) => Future(
        () => http.Response(fixture('list_of_credits_response.json'), 200),
      ),
    );

    ///act
    final result = await homeRemoteDatasourceImpl!.getCreditsForMovie(movieId);

    ///assert
    expect(result, listOfCredits);
    verify(
      mockClient!.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json;charset=utf-8'
        },
      ),
    );
  });
  test('should throw [ServerException] when response code is not 200',
      () async {
    ///arrange
    const int movieId = 550;
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    when(
      mockClient!.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json;charset=utf-8'
        },
      ),
    ).thenAnswer(
      (_) => Future(
        () => http.Response('Something went wrong', 404),
      ),
    );

    ///act
    final call = homeRemoteDatasourceImpl!.getCreditsForMovie;

    ///assert
    expect(() => call(movieId), throwsA(const TypeMatcher<ServerException>()));
  });
  group('getSearchResults', () {
    final List<dynamic> searchResults = [
      const TvEntityModel(
        originCountry: ["GB"],
        id: 24511,
        genres: null,
        posterPath: null,
        overview: '',
        firstAirDate: '',
        originalTitle: 'Bradley',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 1,
        voteCount: 0,
      ),
      const MovieEntityModel(
        id: 179821,
        genres: null,
        posterPath: '/jksXcyWURdXMcGgShL0aMSR7g8d.jpg',
        overview:
            'Bradley vs. Provodnikov for the WBO Welterweight title was fought on March 16th, 2012 at The Home Depot Center in Carson, California, USA.',
        releaseDate: '2013-03-16',
        originalTitle: 'Bradley vs. Provodnikov',
        originalLanguage: 'en',
        backdropPath: '/jzqQCuTQyZAglGMTV8fSE3HKpma.jpg',
        popularity: 1.001714,
        voteCount: 0,
      ),
    ];
    test(
        'should return list of [MovieEntity] and [TvEntity] when the response code is 200',
        () async {
      ///arrange
      const String accessToken =
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';
      const query = 'query';
      const int page = 1;

      ///
      when(
        mockClient!.get(
          Uri.parse(
            'https://api.themoviedb.org/3/search/multi?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US&query=$query&page=$page',
          ),
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json;charset=utf-8'
          },
        ),
      ).thenAnswer(
        (_) => Future(
          () => http.Response(fixture('search_results_response.json'), 200),
        ),
      );

      ///act
      final result =
          await homeRemoteDatasourceImpl!.getSearchResults(query: query);

      ///assert
      expect(result, searchResults);
    });
  });
}

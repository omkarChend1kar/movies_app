import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/src/core/utill/error/exceptions.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/core/utill/network/network_info.dart';
import 'package:movies_app/src/features/home/data/datasources/home_remote_datasource.dart';
import 'package:movies_app/src/features/home/data/models/movie_entity_model.dart';
import 'package:movies_app/src/features/home/data/models/tv_entity_model.dart';
import 'package:movies_app/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';

class MockHomeRemoteDatasource extends Mock implements HomeRemoteDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  HomeRepositoryImpl? homeRepositoryImpl;
  MockHomeRemoteDatasource? mockHomeRemoteDatasource;
  MockNetworkInfo? mockNetworkInfo;

  setUp(() {
    mockHomeRemoteDatasource = MockHomeRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    homeRepositoryImpl = HomeRepositoryImpl(
      remoteDatasource: mockHomeRemoteDatasource!,
      networkInfo: mockNetworkInfo!,
    );
  });
  group('getCreditsForMovie', () {
    final List<CreditsEntity> creditsForMovie = [
      const CreditsEntity(
        originalName: 'originalName',
        characterName: 'characterName',
        profilePath: 'profilePath',
      ),
      const CreditsEntity(
        originalName: 'originalName',
        characterName: 'characterName',
        profilePath: 'profilePath',
      ),
    ];
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected)
            .thenAnswer((_) => Future(() => true));
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getCreditsForMovie(1)).thenAnswer(
          (_) => Future(() => creditsForMovie),
        );

        ///act
        final result = await homeRepositoryImpl!.getCreditsForMovie(1);

        ///assert
        expect(result, Right(creditsForMovie));
      });
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getCreditsForMovie(1)).thenThrow(
          ServerException(),
        );

        ///act
        final result = await homeRepositoryImpl!.getCreditsForMovie(1);

        ///assert
        expect(
          result,
          const Left(
            ServerFailure(message: 'Request failed to get credits'),
          ),
        );
      });
    });
  });
  group('getCreditsForTv', () {
    final List<CreditsEntity> creditsForMovie = [
      const CreditsEntity(
        originalName: 'originalName',
        characterName: 'characterName',
        profilePath: 'profilePath',
      ),
      const CreditsEntity(
        originalName: 'originalName',
        characterName: 'characterName',
        profilePath: 'profilePath',
      ),
    ];
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected)
            .thenAnswer((_) => Future(() => true));
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getCreditsForTv(1)).thenAnswer(
          (_) => Future(() => creditsForMovie),
        );

        ///act
        final result = await homeRepositoryImpl!.getCreditsForTv(1);

        ///assert
        expect(result, Right(creditsForMovie));
      });
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getCreditsForTv(1)).thenThrow(
          ServerException(),
        );

        ///act
        final result = await homeRepositoryImpl!.getCreditsForTv(1);

        ///assert
        expect(
          result,
          const Left(
            ServerFailure(message: 'Request failed to get credits for Tv show'),
          ),
        );
      });
    });
  });
  group('getLatestMovies', () {
    final List<MovieEntityModel> latestMovies = [
      const MovieEntityModel(
        id: 413323,
        genres: [
          {"id": 99, "name": "Documentary"},
        ],
        posterPath: '/chV0avy5ogIB2PMTInT4KpHDzwj.jpg',
        overview:
            'This documentary divided into five segments examines the source and its path to the movies, backstory, special effects story/character areas, cast and performances. It includes notes from Reynolds, Liefeld, Miller, Wernick, Reese, executive producers Aditya Sood and Stan Lee, co-creator/comics writer Fabian Nicieza, producer Simon Kinberg, comics writer Joe Kelly, specialty costume designer Russell Shinkle, makeup designer Bill Corso, production designer Sean Haworth, director of photography Ken Seng, executive producer/unit production manager John J. Kelly, previs supervisor Franck Balson, stunt coordinator Philip J. Silvera, visual effects supervisors Pauline Duvall and Jonathan Rothbart, visual effects producer Annemarie Griggs, 2nd unit director/stunt coordinator Robert Alonzo, special effects coordinator Alex Burdett, utility stunts Regis Harrington, composer Tom Holkenberg, and actors Morena Baccarin, TJ Miller, Brianna Hildebrand, Leslie Uggams, Ed Skrein, and Gina Carano.',
        releaseDate: '2016-05-10',
        originalTitle: 'Deadpool: From Comics to Screen... to Screen',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 0,
      ),
      const MovieEntityModel(
        id: 413323,
        genres: [
          {"id": 99, "name": "Documentary"},
        ],
        posterPath: '/chV0avy5ogIB2PMTInT4KpHDzwj.jpg',
        overview:
            'This documentary divided into five segments examines the source and its path to the movies, backstory, special effects story/character areas, cast and performances. It includes notes from Reynolds, Liefeld, Miller, Wernick, Reese, executive producers Aditya Sood and Stan Lee, co-creator/comics writer Fabian Nicieza, producer Simon Kinberg, comics writer Joe Kelly, specialty costume designer Russell Shinkle, makeup designer Bill Corso, production designer Sean Haworth, director of photography Ken Seng, executive producer/unit production manager John J. Kelly, previs supervisor Franck Balson, stunt coordinator Philip J. Silvera, visual effects supervisors Pauline Duvall and Jonathan Rothbart, visual effects producer Annemarie Griggs, 2nd unit director/stunt coordinator Robert Alonzo, special effects coordinator Alex Burdett, utility stunts Regis Harrington, composer Tom Holkenberg, and actors Morena Baccarin, TJ Miller, Brianna Hildebrand, Leslie Uggams, Ed Skrein, and Gina Carano.',
        releaseDate: '2016-05-10',
        originalTitle: 'Deadpool: From Comics to Screen... to Screen',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 0,
      ),
    ];
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected)
            .thenAnswer((_) => Future(() => true));
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getLatestMovies(page: 1)).thenAnswer(
          (_) => Future(() => latestMovies),
        );

        ///act
        final result = await homeRepositoryImpl!.getUpcomingMovies(page: 1);

        ///assert
        expect(result, Right(latestMovies));
      });
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getLatestMovies(page: 1)).thenThrow(
          ServerException(),
        );

        ///act
        final result = await homeRepositoryImpl!.getUpcomingMovies(page: 1);

        ///assert
        expect(
          result,
          const Left(
            ServerFailure(message: 'Request failed to get latest movies'),
          ),
        );
      });
    });
  });
  group('getPopularMovies', () {
    final List<MovieEntityModel> popularMovies = [
      const MovieEntityModel(
        id: 413323,
        genres: [
          {"id": 99, "name": "Documentary"},
        ],
        posterPath: '/chV0avy5ogIB2PMTInT4KpHDzwj.jpg',
        overview:
            'This documentary divided into five segments examines the source and its path to the movies, backstory, special effects story/character areas, cast and performances. It includes notes from Reynolds, Liefeld, Miller, Wernick, Reese, executive producers Aditya Sood and Stan Lee, co-creator/comics writer Fabian Nicieza, producer Simon Kinberg, comics writer Joe Kelly, specialty costume designer Russell Shinkle, makeup designer Bill Corso, production designer Sean Haworth, director of photography Ken Seng, executive producer/unit production manager John J. Kelly, previs supervisor Franck Balson, stunt coordinator Philip J. Silvera, visual effects supervisors Pauline Duvall and Jonathan Rothbart, visual effects producer Annemarie Griggs, 2nd unit director/stunt coordinator Robert Alonzo, special effects coordinator Alex Burdett, utility stunts Regis Harrington, composer Tom Holkenberg, and actors Morena Baccarin, TJ Miller, Brianna Hildebrand, Leslie Uggams, Ed Skrein, and Gina Carano.',
        releaseDate: '2016-05-10',
        originalTitle: 'Deadpool: From Comics to Screen... to Screen',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 0,
      ),
      const MovieEntityModel(
        id: 413323,
        genres: [
          {"id": 99, "name": "Documentary"},
        ],
        posterPath: '/chV0avy5ogIB2PMTInT4KpHDzwj.jpg',
        overview:
            'This documentary divided into five segments examines the source and its path to the movies, backstory, special effects story/character areas, cast and performances. It includes notes from Reynolds, Liefeld, Miller, Wernick, Reese, executive producers Aditya Sood and Stan Lee, co-creator/comics writer Fabian Nicieza, producer Simon Kinberg, comics writer Joe Kelly, specialty costume designer Russell Shinkle, makeup designer Bill Corso, production designer Sean Haworth, director of photography Ken Seng, executive producer/unit production manager John J. Kelly, previs supervisor Franck Balson, stunt coordinator Philip J. Silvera, visual effects supervisors Pauline Duvall and Jonathan Rothbart, visual effects producer Annemarie Griggs, 2nd unit director/stunt coordinator Robert Alonzo, special effects coordinator Alex Burdett, utility stunts Regis Harrington, composer Tom Holkenberg, and actors Morena Baccarin, TJ Miller, Brianna Hildebrand, Leslie Uggams, Ed Skrein, and Gina Carano.',
        releaseDate: '2016-05-10',
        originalTitle: 'Deadpool: From Comics to Screen... to Screen',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 0,
      ),
    ];
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected)
            .thenAnswer((_) => Future(() => true));
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getPopularMovies(page: 1)).thenAnswer(
          (_) => Future(() => popularMovies),
        );

        ///act
        final result = await homeRepositoryImpl!.getPopularMovies(page: 1);

        ///assert
        expect(result, Right(popularMovies));
      });
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getPopularMovies(page: 1)).thenThrow(
          ServerException(),
        );

        ///act
        final result = await homeRepositoryImpl!.getPopularMovies(page: 1);

        ///assert
        expect(
          result,
          const Left(
            ServerFailure(message: 'Request failed to get popular movies'),
          ),
        );
      });
    });
  });
  group('getTopRatedMovies', () {
    final List<MovieEntityModel> topRatedMovies = [
      const MovieEntityModel(
        id: 413323,
        genres: [
          {"id": 99, "name": "Documentary"},
        ],
        posterPath: '/chV0avy5ogIB2PMTInT4KpHDzwj.jpg',
        overview:
            'This documentary divided into five segments examines the source and its path to the movies, backstory, special effects story/character areas, cast and performances. It includes notes from Reynolds, Liefeld, Miller, Wernick, Reese, executive producers Aditya Sood and Stan Lee, co-creator/comics writer Fabian Nicieza, producer Simon Kinberg, comics writer Joe Kelly, specialty costume designer Russell Shinkle, makeup designer Bill Corso, production designer Sean Haworth, director of photography Ken Seng, executive producer/unit production manager John J. Kelly, previs supervisor Franck Balson, stunt coordinator Philip J. Silvera, visual effects supervisors Pauline Duvall and Jonathan Rothbart, visual effects producer Annemarie Griggs, 2nd unit director/stunt coordinator Robert Alonzo, special effects coordinator Alex Burdett, utility stunts Regis Harrington, composer Tom Holkenberg, and actors Morena Baccarin, TJ Miller, Brianna Hildebrand, Leslie Uggams, Ed Skrein, and Gina Carano.',
        releaseDate: '2016-05-10',
        originalTitle: 'Deadpool: From Comics to Screen... to Screen',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 0,
      ),
      const MovieEntityModel(
        id: 413323,
        genres: [
          {"id": 99, "name": "Documentary"},
        ],
        posterPath: '/chV0avy5ogIB2PMTInT4KpHDzwj.jpg',
        overview:
            'This documentary divided into five segments examines the source and its path to the movies, backstory, special effects story/character areas, cast and performances. It includes notes from Reynolds, Liefeld, Miller, Wernick, Reese, executive producers Aditya Sood and Stan Lee, co-creator/comics writer Fabian Nicieza, producer Simon Kinberg, comics writer Joe Kelly, specialty costume designer Russell Shinkle, makeup designer Bill Corso, production designer Sean Haworth, director of photography Ken Seng, executive producer/unit production manager John J. Kelly, previs supervisor Franck Balson, stunt coordinator Philip J. Silvera, visual effects supervisors Pauline Duvall and Jonathan Rothbart, visual effects producer Annemarie Griggs, 2nd unit director/stunt coordinator Robert Alonzo, special effects coordinator Alex Burdett, utility stunts Regis Harrington, composer Tom Holkenberg, and actors Morena Baccarin, TJ Miller, Brianna Hildebrand, Leslie Uggams, Ed Skrein, and Gina Carano.',
        releaseDate: '2016-05-10',
        originalTitle: 'Deadpool: From Comics to Screen... to Screen',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 0,
      ),
    ];
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected)
            .thenAnswer((_) => Future(() => true));
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getTopRatedMovies(page: 1)).thenAnswer(
          (_) => Future(() => topRatedMovies),
        );

        ///act
        final result = await homeRepositoryImpl!.getTopRatedMovies(page: 1);

        ///assert
        expect(result, Right(topRatedMovies));
      });
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getTopRatedMovies(page: 1)).thenThrow(
          ServerException(),
        );

        ///act
        final result = await homeRepositoryImpl!.getTopRatedMovies(page: 1);

        ///assert
        expect(
          result,
          const Left(
            ServerFailure(message: 'Request failed to get top rated movies'),
          ),
        );
      });
    });
  });
  group('getLatestTvShows', () {
    final List<TvEntityModel> latestTvShows = [
      const TvEntityModel(
        originCountry: ["US"],
        id: 67625,
        genres: [
          {"id": 35, "name": "Comedy"},
          {"id": 10764, "name": "Reality"}
        ],
        posterPath: null,
        overview: null,
        firstAirDate: '2016-08-23',
        originalTitle: 'You Can Do Better',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 1,
      ),
      const TvEntityModel(
        originCountry: ["US"],
        id: 67625,
        genres: [
          {"id": 35, "name": "Comedy"},
          {"id": 10764, "name": "Reality"}
        ],
        posterPath: null,
        overview: null,
        firstAirDate: '2016-08-23',
        originalTitle: 'You Can Do Better',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 1,
      ),
    ];
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected)
            .thenAnswer((_) => Future(() => true));
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getSimilarTvShows(1, page: 1))
            .thenAnswer(
          (_) => Future(() => latestTvShows),
        );

        ///act
        final result = await homeRepositoryImpl!.getSimilarTvShows(1, page: 1);

        ///assert
        expect(result, Right(latestTvShows));
      });
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getSimilarTvShows(1, page: 1)).thenThrow(
          ServerException(),
        );

        ///act
        final result = await homeRepositoryImpl!.getSimilarTvShows(1, page: 1);

        ///assert
        expect(
          result,
          const Left(
            ServerFailure(message: 'Request failed to get latest tv shows'),
          ),
        );
      });
    });
  });
  group('getPopularTvShows', () {
    final List<TvEntityModel> popularTvShows = [
      const TvEntityModel(
        originCountry: ["US"],
        id: 67625,
        genres: [
          {"id": 35, "name": "Comedy"},
          {"id": 10764, "name": "Reality"}
        ],
        posterPath: null,
        overview: null,
        firstAirDate: '2016-08-23',
        originalTitle: 'You Can Do Better',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 1,
      ),
      const TvEntityModel(
        originCountry: ["US"],
        id: 67625,
        genres: [
          {"id": 35, "name": "Comedy"},
          {"id": 10764, "name": "Reality"}
        ],
        posterPath: null,
        overview: null,
        firstAirDate: '2016-08-23',
        originalTitle: 'You Can Do Better',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 1,
      ),
    ];
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected)
            .thenAnswer((_) => Future(() => true));
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getPopularTvShows(page: 1)).thenAnswer(
          (_) => Future(() => popularTvShows),
        );

        ///act
        final result = await homeRepositoryImpl!.getPopularTvShows(page: 1);

        ///assert
        expect(result, Right(popularTvShows));
      });
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getPopularTvShows(page: 1)).thenThrow(
          ServerException(),
        );

        ///act
        final result = await homeRepositoryImpl!.getPopularTvShows(page: 1);

        ///assert
        expect(
          result,
          const Left(
            ServerFailure(message: 'Request failed to get popular tv shows'),
          ),
        );
      });
    });
  });
  group('getTopRatedTvShows', () {
    final List<TvEntityModel> topRatedTvShows = [
      const TvEntityModel(
        originCountry: ["US"],
        id: 67625,
        genres: [
          {"id": 35, "name": "Comedy"},
          {"id": 10764, "name": "Reality"}
        ],
        posterPath: null,
        overview: null,
        firstAirDate: '2016-08-23',
        originalTitle: 'You Can Do Better',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 1,
      ),
      const TvEntityModel(
        originCountry: ["US"],
        id: 67625,
        genres: [
          {"id": 35, "name": "Comedy"},
          {"id": 10764, "name": "Reality"}
        ],
        posterPath: null,
        overview: null,
        firstAirDate: '2016-08-23',
        originalTitle: 'You Can Do Better',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 1,
      ),
    ];
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected)
            .thenAnswer((_) => Future(() => true));
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getTopRatedTvShows(page: 1)).thenAnswer(
          (_) => Future(() => topRatedTvShows),
        );

        ///act
        final result = await homeRepositoryImpl!.getTopRatedTvShows(page: 1);

        ///assert
        expect(result, Right(topRatedTvShows));
      });
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!.getTopRatedTvShows(page: 1)).thenThrow(
          ServerException(),
        );

        ///act
        final result = await homeRepositoryImpl!.getTopRatedTvShows(page: 1);

        ///assert
        expect(
          result,
          const Left(
            ServerFailure(message: 'Request failed to get top rated tv shows'),
          ),
        );
      });
    });
  });
  group('getSearchResults', () {
    final List searchResults = [
      const TvEntityModel(
        originCountry: ["US"],
        id: 67625,
        genres: [
          {"id": 35, "name": "Comedy"},
          {"id": 10764, "name": "Reality"}
        ],
        posterPath: null,
        overview: null,
        firstAirDate: '2016-08-23',
        originalTitle: 'You Can Do Better',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 1,
      ),
      const MovieEntityModel(
        id: 413323,
        genres: [
          {"id": 99, "name": "Documentary"},
        ],
        posterPath: '/chV0avy5ogIB2PMTInT4KpHDzwj.jpg',
        overview:
            'This documentary divided into five segments examines the source and its path to the movies, backstory, special effects story/character areas, cast and performances. It includes notes from Reynolds, Liefeld, Miller, Wernick, Reese, executive producers Aditya Sood and Stan Lee, co-creator/comics writer Fabian Nicieza, producer Simon Kinberg, comics writer Joe Kelly, specialty costume designer Russell Shinkle, makeup designer Bill Corso, production designer Sean Haworth, director of photography Ken Seng, executive producer/unit production manager John J. Kelly, previs supervisor Franck Balson, stunt coordinator Philip J. Silvera, visual effects supervisors Pauline Duvall and Jonathan Rothbart, visual effects producer Annemarie Griggs, 2nd unit director/stunt coordinator Robert Alonzo, special effects coordinator Alex Burdett, utility stunts Regis Harrington, composer Tom Holkenberg, and actors Morena Baccarin, TJ Miller, Brianna Hildebrand, Leslie Uggams, Ed Skrein, and Gina Carano.',
        releaseDate: '2016-05-10',
        originalTitle: 'Deadpool: From Comics to Screen... to Screen',
        originalLanguage: 'en',
        backdropPath: null,
        popularity: 0,
        voteCount: 0,
      ),
    ];
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected)
            .thenAnswer((_) => Future(() => true));
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!
                .getSearchResults(page: 1, query: 'query'))
            .thenAnswer(
          (_) => Future(() => searchResults),
        );

        ///act
        final result =
            await homeRepositoryImpl!.getSearchResults(page: 1, query: 'query');

        ///assert
        expect(result, Right(searchResults));
      });
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        ///arrange
        when(mockHomeRemoteDatasource!
                .getSearchResults(page: 1, query: 'query'))
            .thenThrow(
          ServerException(),
        );

        ///act
        final result =
            await homeRepositoryImpl!.getSearchResults(page: 1, query: 'query');

        ///assert
        expect(
          result,
          const Left(
            ServerFailure(message: 'Request failed to get search results'),
          ),
        );
      });
    });
  });
}

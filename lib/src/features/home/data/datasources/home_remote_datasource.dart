import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_app/src/core/utill/error/exceptions.dart';
import 'package:movies_app/src/features/home/data/models/credits_entity_model.dart';
import 'package:movies_app/src/features/home/data/models/movie_entity_model.dart';
import 'package:movies_app/src/features/home/data/models/tv_entity_model.dart';
import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';

abstract class HomeRemoteDatasource {
  ///
  Future<List<MovieEntity>>? getPopularMovies({int page = 1});

  ///
  Future<List<MovieEntity>>? getLatestMovies({int page = 1});

  ///
  Future<List<MovieEntity>>? getTopRatedMovies({int page = 1});

  ///
  Future<List<TvEntity>>? getPopularTvShows({int page = 1});

  ///
  Future<List<TvEntity>>? getSimilarTvShows(int id, {int page = 1});

  ///
  Future<List<TvEntity>>? getTopRatedTvShows({int page = 1});

  ///
  Future<List<dynamic>>? getSearchResults(
      {required String query, int page = 1});

  ///
  Future<List<CreditsEntity>>? getCreditsForMovie(int id, {int page = 1});

  ///
  Future<List<CreditsEntity>>? getCreditsForTv(int id, {int page = 1});
}

///
///
///
///
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final http.Client httpClient;

  HomeRemoteDatasourceImpl({
    required this.httpClient,
  });
  @override
  Future<List<CreditsEntity>>? getCreditsForMovie(int id, {int page = 1}) {
    ///
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    final Future<Response> futureResponse = httpClient.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/credits?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8'
      },
    );

    ///
    return futureResponse.then((response) {
      if (response.statusCode == 200) {
        ///
        final jsonMap = jsonDecode(response.body);

        ///
        final List<dynamic> listOfRawCreditsMap = jsonMap["cast"];

        ///
        final listOfCredits = List<CreditsEntity>.from(
          listOfRawCreditsMap.map(
            (json) => CreditsEntityModel.fromJson(json),
          ),
        );
        return listOfCredits;
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<List<CreditsEntity>>? getCreditsForTv(int id, {int page = 1}) {
    ///
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    final Future<Response> futureResponse = httpClient.get(
      Uri.parse(
          'https://api.themoviedb.org/3/tv/$id/credits?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8'
      },
    );

    ///
    return futureResponse.then((response) {
      if (response.statusCode == 200) {
        ///
        final jsonMap = jsonDecode(response.body);

        ///
        final List<dynamic> listOfRawCreditsMap = jsonMap["cast"];

        ///
        final listOfCredits = List<CreditsEntity>.from(
          listOfRawCreditsMap.map(
            (json) => CreditsEntityModel.fromJson(json),
          ),
        );
        return listOfCredits;
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<List<MovieEntity>>? getLatestMovies({int page = 1}) {
    ///
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    final Future<Response> futureResponse = httpClient.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US&page=$page'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8'
      },
    );
    return futureResponse.then((response) {
      if (response.statusCode == 200) {
        ///
        final jsonMap = jsonDecode(response.body);

        ///
        final List<dynamic> listOfRawCreditsMap = jsonMap["results"];

        ///
        final listOfMovies = List<MovieEntity>.from(
          listOfRawCreditsMap.map(
            (json) => MovieEntityModel.fromJson(json),
          ),
        );
        return listOfMovies;
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<List<TvEntity>>? getSimilarTvShows(int id, {int page = 1}) {
    ///
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    final Future<Response> futureResponse = httpClient.get(
      Uri.parse(
          'https://api.themoviedb.org/3/tv/$id/similar?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US&page=$page'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8'
      },
    );
    return futureResponse.then((response) {
      if (response.statusCode == 200) {
        ///
        final jsonMap = jsonDecode(response.body);

        ///
        final List<dynamic> listOfRawCreditsMap = jsonMap["results"];

        ///
        final listOfTvShows = List<TvEntity>.from(
          listOfRawCreditsMap.map(
            (json) => TvEntityModel.fromJson(json),
          ),
        );
        return listOfTvShows;
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<List<MovieEntity>>? getPopularMovies({int page = 1}) {
    ///
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    final Future<Response> futureResponse = httpClient.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US&page=$page'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8'
      },
    );
    return futureResponse.then((response) {
      if (response.statusCode == 200) {
        ///
        final jsonMap = jsonDecode(response.body);

        ///
        final List<dynamic> listOfRawCreditsMap = jsonMap["results"];

        ///
        final listOfMovies = List<MovieEntity>.from(
          listOfRawCreditsMap.map(
            (json) => MovieEntityModel.fromJson(json),
          ),
        );
        return listOfMovies;
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<List<TvEntity>>? getPopularTvShows({int page = 1}) {
    ///
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    final Future<Response> futureResponse = httpClient.get(
      Uri.parse(
          'https://api.themoviedb.org/3/tv/popular?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US&page=$page'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8'
      },
    );
    return futureResponse.then((response) {
      if (response.statusCode == 200) {
        ///
        final jsonMap = jsonDecode(response.body);

        ///
        final List<dynamic> listOfRawCreditsMap = jsonMap["results"];

        ///
        final listOfTvShows = List<TvEntity>.from(
          listOfRawCreditsMap.map(
            (json) => TvEntityModel.fromJson(json),
          ),
        );
        return listOfTvShows;
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<List>? getSearchResults({required String query, int page = 1}) {
    ///
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    final Future<Response> futureResponse = httpClient.get(
      Uri.parse(
        'https://api.themoviedb.org/3/search/multi?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US&query=$query&page=$page',
      ),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8'
      },
    );
    return futureResponse.then((response) {
      if (response.statusCode == 200) {
        ///
        final jsonMap = jsonDecode(response.body);

        ///
        final List<dynamic> listOfRawCreditsMap = jsonMap["results"];

        ///
        final listOfEntites = List<dynamic>.from(
          listOfRawCreditsMap.map(
            (json) {
              if (json['media_type'] == 'tv') {
                return TvEntityModel.fromJson(json);
              } else if (json['media_type'] == 'movie') {
                return MovieEntityModel.fromJson(json);
              }
            },
          ),
        );
        return listOfEntites;
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<List<MovieEntity>>? getTopRatedMovies({int page = 1}) {
    ///
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    final Future<Response> futureResponse = httpClient.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US&page=$page'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8'
      },
    );
    return futureResponse.then((response) {
      if (response.statusCode == 200) {
        ///
        final jsonMap = jsonDecode(response.body);

        ///
        final List<dynamic> listOfRawCreditsMap = jsonMap["results"];

        ///
        final listOfMovies = List<MovieEntity>.from(
          listOfRawCreditsMap.map(
            (json) => MovieEntityModel.fromJson(json),
          ),
        );
        return listOfMovies;
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<List<TvEntity>>? getTopRatedTvShows({int page = 1}) {
    ///
    const String accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzVhNzZjZWJlNzE0OTgwY2E0MzZiNzgyZGZiMjczYiIsInN1YiI6IjYzMzdhODBkNGYzM2FkMDA4MmNkOWM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sntb1WPcYfqAb_FjIOIuF7SRVEo0JofF5fHfi8yLSaw';

    ///
    final Future<Response> futureResponse = httpClient.get(
      Uri.parse(
          'https://api.themoviedb.org/3/tv/top_rated?api_key=ec5a76cebe714980ca436b782dfb273b&language=en-US&page=$page'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8'
      },
    );
    return futureResponse.then((response) {
      if (response.statusCode == 200) {
        ///
        final jsonMap = jsonDecode(response.body);

        ///
        final List<dynamic> listOfRawCreditsMap = jsonMap["results"];

        ///
        final listOfTvShows = List<TvEntity>.from(
          listOfRawCreditsMap.map(
            (json) => TvEntityModel.fromJson(json),
          ),
        );
        return listOfTvShows;
      } else {
        throw ServerException();
      }
    });
  }
}

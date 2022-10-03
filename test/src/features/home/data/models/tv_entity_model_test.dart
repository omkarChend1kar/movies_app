import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/src/features/home/data/models/movie_entity_model.dart';
import 'package:movies_app/src/features/home/data/models/tv_entity_model.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tvEntityModel = TvEntityModel(
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
  );

  test('should be subclass of tvEntity', () {
    ///arrange
    ///act
    ///assert
    expect(tvEntityModel, isA<TvEntity>());
  });

  group('fromJson', () {
    test('should get valid [TvEntityModel]', () async {
      ///arrange
      final Map<String, dynamic> jsonMap = jsonDecode(
        fixture('tv_response.json'),
      );

      ///act
      final result = TvEntityModel.fromJson(jsonMap);

      ///assert
      expect(result, tvEntityModel);
    });
  });
  group('toJson', () {
    test('should return Json map containing proper data', () async {
      ///arrange
      final Map<String, dynamic> expectedMap = {
        'originCountry': ["US"],
        'totalEpisodes': 1,
        'totalSeasons': 1,
        'id': 67625,
        'genres': [
          {"id": 35, "name": "Comedy"},
          {"id": 10764, "name": "Reality"}
        ],
        'posterPath': null,
        'overview': null,
        'firstAirDate': '2016-08-23',
        'originalTitle': 'You Can Do Better',
        'originalLanguage': 'en',
        'backdropPath': null,
        'popularity': 0,
        'voteCount': 1,
      };

      ///act
      final result = tvEntityModel.toJson();

      ///assert
      expect(result, expectedMap);
    });
  });
}

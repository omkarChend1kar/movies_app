import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/src/features/home/data/models/movie_entity_model.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const movieEntityModel = MovieEntityModel(
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
  );

  test('should be subclass of MovieEntity', () {
    ///arrange
    ///act
    ///assert
    expect(movieEntityModel, isA<MovieEntity>());
  });

  group('fromJson', () {
    test('should get valid [MovieEntityModel]', () async {
      ///arrange
      final Map<String, dynamic> jsonMap = jsonDecode(
        fixture('movie_response.json'),
      );

      ///act
      final result = MovieEntityModel.fromJson(jsonMap);

      ///assert
      expect(result, movieEntityModel);
    });
  });
  group('toJson', () {
    test('should return Json map containing proper data', () async {
      ///arrange
      final Map<String, dynamic> expectedMap = {
        'id': 413323,
        'genres': [
          {"id": 99, "name": "Documentary"},
        ],
        'posterPath': '/chV0avy5ogIB2PMTInT4KpHDzwj.jpg',
        'overview':
            'This documentary divided into five segments examines the source and its path to the movies, backstory, special effects story/character areas, cast and performances. It includes notes from Reynolds, Liefeld, Miller, Wernick, Reese, executive producers Aditya Sood and Stan Lee, co-creator/comics writer Fabian Nicieza, producer Simon Kinberg, comics writer Joe Kelly, specialty costume designer Russell Shinkle, makeup designer Bill Corso, production designer Sean Haworth, director of photography Ken Seng, executive producer/unit production manager John J. Kelly, previs supervisor Franck Balson, stunt coordinator Philip J. Silvera, visual effects supervisors Pauline Duvall and Jonathan Rothbart, visual effects producer Annemarie Griggs, 2nd unit director/stunt coordinator Robert Alonzo, special effects coordinator Alex Burdett, utility stunts Regis Harrington, composer Tom Holkenberg, and actors Morena Baccarin, TJ Miller, Brianna Hildebrand, Leslie Uggams, Ed Skrein, and Gina Carano.',
        'releaseDate': '2016-05-10',
        'originalTitle': 'Deadpool: From Comics to Screen... to Screen',
        'originalLanguage': 'en',
        'backdropPath': null,
        'popularity': 0,
        'voteCount': 0,
      };

      ///act
      final result = movieEntityModel.toJson();

      ///assert
      expect(result, expectedMap);
    });
  });
}

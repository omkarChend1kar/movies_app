import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/src/features/home/data/models/credits_entity_model.dart';
import 'package:movies_app/src/features/home/data/models/movie_entity_model.dart';
import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const creditsEntityModel = CreditsEntityModel(
    originalName: 'Edward Norton',
    characterName: 'The Narrator',
    profilePath: '/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg',
  );

  test('should be subclass of CreditsEntity', () {
    ///arrange
    ///act
    ///assert
    expect(creditsEntityModel, isA<CreditsEntity>());
  });

  group('fromJson', () {
    test('should get valid [CreditsEntityModel]', () async {
      ///arrange
      final Map<String, dynamic> jsonMap = jsonDecode(
        fixture('credits_response.json'),
      );

      ///act
      final result = CreditsEntityModel.fromJson(jsonMap);

      ///assert
      expect(result, creditsEntityModel);
    });
  });
  group('toJson', () {
    test('should return Json map containing proper data', () async {
      ///arrange
      final Map<String, dynamic> expectedMap = {
        'originalName': 'Edward Norton',
        'characterName': 'The Narrator',
        'profilePath': '/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg',
      };

      ///act
      final result = creditsEntityModel.toJson();

      ///assert
      expect(result, expectedMap);
    });
  });
}

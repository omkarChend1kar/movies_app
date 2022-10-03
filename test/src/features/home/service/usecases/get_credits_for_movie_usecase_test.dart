import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_credits_for_movie_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  GetCreditsForMovieUsecaseImpl? getCreditsForMovie;
  MockHomeRepository? mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getCreditsForMovie =
        GetCreditsForMovieUsecaseImpl(repository: mockHomeRepository!);
  });

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

  test('should get list of credits for movie from repository', () async {
    ///arrange
    when(mockHomeRepository!.getCreditsForMovie(1))
        .thenAnswer((_) async => Future(() => Right(creditsForMovie)));

    ///act
    final result = await getCreditsForMovie!(const Params(id: 1));

    ///assert
    expect(result, Right(creditsForMovie));
    verify(mockHomeRepository!.getCreditsForMovie(1));
  });
}

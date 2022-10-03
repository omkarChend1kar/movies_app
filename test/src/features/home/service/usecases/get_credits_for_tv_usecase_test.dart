import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/get_credits_for_tv_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  GetCreditsForTvUsecaseImpl? getCreditsForTv;
  MockHomeRepository? mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getCreditsForTv =
        GetCreditsForTvUsecaseImpl(repository: mockHomeRepository!);
  });

  final List<CreditsEntity> creditsForTv = [
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

  test('should get list of credits for Tv from repository', () async {
    ///arrange
    when(mockHomeRepository!.getCreditsForTv(1))
        .thenAnswer((_) async => Future(() => Right(creditsForTv)));

    ///act
    final result = await getCreditsForTv!(const Params(id: 1));

    ///assert
    expect(result, Right(creditsForTv));
    verify(mockHomeRepository!.getCreditsForTv(1));
  });
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/core/utill/usecase/usecase.dart';
import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/home_usecase.dart';

///[Marker Interface] to
abstract class GetCreditsForTvUsecase extends HomeUsecase
    implements UseCase<List<CreditsEntity>, Params> {}

class Params extends Equatable {
  final int? page;
  final int id;

  const Params({
    required this.id,
    this.page,
  });
  @override
  List<Object?> get props => [];
}

class GetCreditsForTvUsecaseImpl extends GetCreditsForTvUsecase {
  ///
  final HomeRepository repository;

  ///
  GetCreditsForTvUsecaseImpl({required this.repository});

  @override
  Future<Either<Failures, List<CreditsEntity>>>? call(Params params) {
    if (params.page != null) {
      return repository.getCreditsForTv(params.id, page: params.page!);
    } else {
      return repository.getCreditsForTv(params.id);
    }
  }
}

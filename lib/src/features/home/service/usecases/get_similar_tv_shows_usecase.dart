import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/core/utill/usecase/usecase.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/home_usecase.dart';

///[Marker Interface] to get search results filtered by keywords entered in search bar
abstract class GetSimilarTvShowsUsecase extends HomeUsecase
    implements UseCase<List<TvEntity>, Params> {}

class Params extends Equatable {
  final int? page;
  final int id;

  const Params(this.id, {this.page});
  @override
  List<Object?> get props => [page];
}

class GetSimilarTvShowsUsecaseImpl extends GetSimilarTvShowsUsecase {
  ///
  final HomeRepository repository;

  ///
  GetSimilarTvShowsUsecaseImpl({required this.repository});

  @override
  Future<Either<Failures, List<TvEntity>>>? call(Params params) {
    if (params.page != null) {
      return repository.getSimilarTvShows(params.id, page: params.page!);
    } else {
      return repository.getSimilarTvShows(
        params.id,
      );
    }
  }
}

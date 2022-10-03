import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/core/utill/usecase/usecase.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/home_usecase.dart';

///[Marker Interface] to get search results filtered by keywords entered in search bar
abstract class GetSearchResultsUsecase extends HomeUsecase
    implements UseCase<List<dynamic>, Params> {}

class Params extends Equatable {
  final int? page;
  final String query;

  const Params({
    required this.query,
    this.page,
  });
  @override
  List<Object?> get props => [page,query];
}

class GetSearchResultsUsecaseImpl extends GetSearchResultsUsecase {
  ///
  final HomeRepository repository;

  ///
  GetSearchResultsUsecaseImpl({required this.repository});

  @override
  Future<Either<Failures, List<dynamic>>>? call(Params params) {
    if (params.page != null) {
      return repository.getSearchResults(
          query: params.query, page: params.page!);
    } else {
      return repository.getSearchResults(query: params.query);
    }
  }
}

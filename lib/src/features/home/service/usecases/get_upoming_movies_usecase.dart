import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/core/utill/usecase/usecase.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/repositories/home_repository.dart';
import 'package:movies_app/src/features/home/service/usecases/home_usecase.dart';

///[Marker Interface] to get search results filtered by keywords entered in search bar
abstract class GetUpcomingMoviesUsecase extends HomeUsecase
    implements UseCase<List<MovieEntity>, Params> {}

class Params extends Equatable {
  final int? page;

  const Params({this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetUpcomingMoviesUsecaseImpl extends GetUpcomingMoviesUsecase {
  ///
  final HomeRepository repository;

  ///
  GetUpcomingMoviesUsecaseImpl({required this.repository});

  @override
  Future<Either<Failures, List<MovieEntity>>>? call(Params params) {
    if (params.page != null) {
      return repository.getUpcomingMovies(page: params.page!);
    } else {
      return repository.getUpcomingMovies();
    }
  }
}

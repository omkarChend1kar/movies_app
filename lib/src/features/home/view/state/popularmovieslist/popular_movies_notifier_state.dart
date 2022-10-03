import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';

///
abstract class PopularMoviesNotifierState extends Equatable {}

///
class PopularMoviesNotifierInitialState extends PopularMoviesNotifierState {
  final int page;

  PopularMoviesNotifierInitialState({int? page}) : page = 1;
  @override
  List<Object?> get props => [];
}

///
class PopularMoviesNotifierCompleteState extends PopularMoviesNotifierState {
  final List<MovieEntity> popularMovies;
  final int page;

  PopularMoviesNotifierCompleteState({
    required this.popularMovies,
    required this.page,
  });

  PopularMoviesNotifierCompleteState copyWith({
    List<MovieEntity>? popularMovies,
    int? page,
  }) {
    return PopularMoviesNotifierCompleteState(
      popularMovies: popularMovies ?? this.popularMovies,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [popularMovies, page];
}

///
class PopularMoviesNotifierErrorState extends PopularMoviesNotifierState {
  final Failures failures;

  PopularMoviesNotifierErrorState({required this.failures});
  @override
  List<Object?> get props => [failures];
}

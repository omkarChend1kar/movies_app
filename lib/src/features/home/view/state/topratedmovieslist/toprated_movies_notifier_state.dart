import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';

///
abstract class TopRatedMoviesNotifierState extends Equatable {}

///
class TopRatedMoviesNotifierInitialState extends TopRatedMoviesNotifierState {
  final List<MovieEntity> upcomingMovies;
  final int page;

  TopRatedMoviesNotifierInitialState(
      {int? page, List<MovieEntity>? upcomingMovies})
      : page = 1,
        upcomingMovies = [];
  @override
  List<Object?> get props => [];
}

///
class TopRatedMoviesNotifierCompleteState extends TopRatedMoviesNotifierState {
  final List<MovieEntity> topRatedMovies;
  final int page;

  TopRatedMoviesNotifierCompleteState({
    required this.topRatedMovies,
    required this.page,
  });

  TopRatedMoviesNotifierCompleteState copyWith({
    List<MovieEntity>? topRatedMovies,
    int? page,
  }) {
    return TopRatedMoviesNotifierCompleteState(
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [topRatedMovies, page];
}

///
class TopRatedMoviesNotifierErrorState extends TopRatedMoviesNotifierState {
  final Failures failures;

  TopRatedMoviesNotifierErrorState({required this.failures});
  @override
  List<Object?> get props => [failures];
}

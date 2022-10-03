import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';

///
abstract class UpcomingMoviesNotifierState extends Equatable {}

///
class UpcomingMoviesNotifierInitialState extends UpcomingMoviesNotifierState {
  final List<MovieEntity> upcomingMovies;
  final int page;

  UpcomingMoviesNotifierInitialState(
      {int? page, List<MovieEntity>? upcomingMovies})
      : page = 1,
        upcomingMovies = [];

  @override
  List<Object?> get props => [];
}

///
class UpcomingMoviesNotifierCompleteState extends UpcomingMoviesNotifierState {
  final List<MovieEntity> upcomingMovies;
  final int page;

  UpcomingMoviesNotifierCompleteState(
      {required this.upcomingMovies, required this.page});

  UpcomingMoviesNotifierCompleteState copyWith({
    List<MovieEntity>? upcomingMovies,
    int? page,
  }) {
    return UpcomingMoviesNotifierCompleteState(
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [upcomingMovies, page];
}

///
class UpcomingMoviesNotifierErrorState extends UpcomingMoviesNotifierState {
  final Failures failures;

  UpcomingMoviesNotifierErrorState({required this.failures});
  @override
  List<Object?> get props => [failures];
}

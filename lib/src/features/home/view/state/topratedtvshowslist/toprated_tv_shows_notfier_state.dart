import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';

///
abstract class TopRatedTvShowsNotifierState extends Equatable {}

///
class TopRatedTvShowsNotifierInitialState extends TopRatedTvShowsNotifierState {
  final List<TvEntity> topRatedTvShows;
  final int page;

  TopRatedTvShowsNotifierInitialState(
      {List<TvEntity>? topRatedTvShows, int? page})
      : page = 1,
        topRatedTvShows = [];
  @override
  List<Object?> get props => [];
}

///
class TopRatedTvShowsNotifierCompleteState
    extends TopRatedTvShowsNotifierState {
  final List<TvEntity> topRatedTvShows;
  final int page;

  TopRatedTvShowsNotifierCompleteState({
    required this.topRatedTvShows,
    required this.page,
  });

  TopRatedTvShowsNotifierCompleteState copyWith({
    List<TvEntity>? topRatedTvShows,
    int? page,
  }) {
    return TopRatedTvShowsNotifierCompleteState(
      topRatedTvShows: topRatedTvShows ?? this.topRatedTvShows,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [topRatedTvShows, page];
}

///
class TopRatedTvShowsNotifierErrorState extends TopRatedTvShowsNotifierState {
  final Failures failures;

  TopRatedTvShowsNotifierErrorState({required this.failures});
  @override
  List<Object?> get props => [failures];
}

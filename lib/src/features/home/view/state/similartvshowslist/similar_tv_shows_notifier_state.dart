import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';

///
abstract class SimilarTvShowsNotifierState extends Equatable {}

///
class SimilarTvShowsNotifierInitialState extends SimilarTvShowsNotifierState {
  @override
  List<Object?> get props => [];
}

///
class SimilarTvShowsNotifierCompleteState extends SimilarTvShowsNotifierState {
  final List<TvEntity> similarTvShows;
  final int page;

  SimilarTvShowsNotifierCompleteState(
      {int? page, List<TvEntity>? similarTvShows})
      : page = 1,
        similarTvShows = [];

  SimilarTvShowsNotifierCompleteState copyWith({
    List<TvEntity>? similarTvShows,
    int? page,
  }) {
    return SimilarTvShowsNotifierCompleteState(
      similarTvShows: similarTvShows ?? this.similarTvShows,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [similarTvShows, page];
}

///
class SimilarTvShowsNotifierErrorState extends SimilarTvShowsNotifierState {
  final Failures failures;

  SimilarTvShowsNotifierErrorState({required this.failures});
  @override
  List<Object?> get props => [failures];
}
 
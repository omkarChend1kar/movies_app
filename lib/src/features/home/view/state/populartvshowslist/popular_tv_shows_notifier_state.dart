import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';

///
abstract class PopularTvShowsNotifierState extends Equatable {}

///
class PopularTvShowsNotifierInitialState extends PopularTvShowsNotifierState {
  final List<TvEntity> popularTvShows;
  final int page;

  PopularTvShowsNotifierInitialState({List<TvEntity>? popularTvShows, int? page})
      : page = 1,
        popularTvShows = [];
  @override
  List<Object?> get props => [];
}

///
class PopularTvShowsNotifierCompleteState extends PopularTvShowsNotifierState {
  final List<TvEntity> popularTvShows;
  final int page;

  PopularTvShowsNotifierCompleteState({
    required this.popularTvShows,
    required this.page,
  });

  PopularTvShowsNotifierCompleteState copyWith({
    List<TvEntity>? popularTvShows,
    int? page,
  }) {
    return PopularTvShowsNotifierCompleteState(
      popularTvShows: popularTvShows ?? this.popularTvShows,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [popularTvShows, page];
}

///
class PopularTvShowsNotifierErrorState extends PopularTvShowsNotifierState {
  final Failures failures;

  PopularTvShowsNotifierErrorState({required this.failures});
  @override
  List<Object?> get props => [failures];
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/service/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/src/features/home/view/state/home_notifier.dart';
import 'package:movies_app/src/features/home/view/state/topratedmovieslist/toprated_movies_notifier_state.dart';

class TopRatedMoviesNotifierImpl
    extends StateNotifier<TopRatedMoviesNotifierState>
    implements TopRatedMoviesNotifier {
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  TopRatedMoviesNotifierImpl({required this.getTopRatedMoviesUsecase})
      : super(TopRatedMoviesNotifierInitialState()) {
    ///
    notifyMovieEntityList();
  }

  @override
  notifyMovieEntityList() {
    ///
    final response = getTopRatedMoviesUsecase(
      Params(
        page: state is TopRatedMoviesNotifierInitialState
            ? (state as TopRatedMoviesNotifierInitialState).page
            : (state as TopRatedMoviesNotifierCompleteState).page,
      ),
    );

    ///
    response!.then((value) {
      value.fold((l) => TopRatedMoviesNotifierErrorState(failures: l),
          (movies) {
        state = TopRatedMoviesNotifierCompleteState(
          page: state is TopRatedMoviesNotifierInitialState
              ? (state as TopRatedMoviesNotifierInitialState).page
              : (state as TopRatedMoviesNotifierCompleteState).page + 1,
          topRatedMovies: (state is TopRatedMoviesNotifierInitialState)
              ? movies
              : [
                  ...(state as TopRatedMoviesNotifierCompleteState)
                      .topRatedMovies,
                  ...movies,
                ],
        );
      });
    });
  }
}

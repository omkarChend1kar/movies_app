import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/service/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/src/features/home/view/state/home_notifier.dart';
import 'package:movies_app/src/features/home/view/state/popularmovieslist/popular_movies_notifier_state.dart';

class PopularMoviesNotifierImpl
    extends StateNotifier<PopularMoviesNotifierState>
    implements PopularMoviesNotifier {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  PopularMoviesNotifierImpl({required this.getPopularMoviesUsecase})
      : super(PopularMoviesNotifierInitialState()) {
    ///
    notifyMovieEntityList();
  }

  @override
  notifyMovieEntityList() {
    ///
    final response = getPopularMoviesUsecase(
      Params(
        page: state is PopularMoviesNotifierInitialState
            ? (state as PopularMoviesNotifierInitialState).page
            : (state as PopularMoviesNotifierCompleteState).page,
      ),
    );

    ///
    response!.then((value) {
      value.fold((l) => PopularMoviesNotifierErrorState(failures: l), (movies) {
        state = PopularMoviesNotifierCompleteState(
          page: state is PopularMoviesNotifierInitialState
              ? (state as PopularMoviesNotifierInitialState).page
              : (state as PopularMoviesNotifierCompleteState).page + 1,
          popularMovies: (state is PopularMoviesNotifierInitialState)
              ? movies
              : [
                  ...(state as PopularMoviesNotifierCompleteState)
                      .popularMovies,
                  ...movies,
                ],
        );
      });
    });
  }
}

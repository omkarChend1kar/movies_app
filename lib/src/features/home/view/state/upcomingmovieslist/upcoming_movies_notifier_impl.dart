import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/service/usecases/get_upoming_movies_usecase.dart';
import 'package:movies_app/src/features/home/view/state/home_notifier.dart';
import 'package:movies_app/src/features/home/view/state/upcomingmovieslist/upcoming_movies_notifier_state.dart';

class UpcomingMoviesNotifierImpl
    extends StateNotifier<UpcomingMoviesNotifierState>
    implements UpcomingMoviesNotifier {
  final GetUpcomingMoviesUsecase getUpcomingMoviesUsecase;
  UpcomingMoviesNotifierImpl({required this.getUpcomingMoviesUsecase})
      : super(UpcomingMoviesNotifierInitialState()) {
    ///
    notifyMovieEntityList();
  }

  @override
  notifyMovieEntityList() async {
    ///
    final response = await getUpcomingMoviesUsecase(
      Params(
        page: state is UpcomingMoviesNotifierInitialState
            ? (state as UpcomingMoviesNotifierInitialState).page
            : (state as UpcomingMoviesNotifierCompleteState).page,
      ),
    );

    ///
    // response!.then((value) {
    response!.fold(
      (l) => state = UpcomingMoviesNotifierErrorState(failures: l),
      (movies) {
        state = UpcomingMoviesNotifierCompleteState(
          page: state is UpcomingMoviesNotifierInitialState
              ? (state as UpcomingMoviesNotifierInitialState).page
              : (state as UpcomingMoviesNotifierCompleteState).page + 1,
          upcomingMovies: (state is UpcomingMoviesNotifierInitialState)
              ? movies
              : [
                  ...(state as UpcomingMoviesNotifierCompleteState)
                      .upcomingMovies,
                  ...movies,
                ],
        );
      },
      //     (state as UpcomingMoviesNotifierCompleteState).copyWith(
      //   page: (state as UpcomingMoviesNotifierCompleteState).page + 1,
      //   upcomingMovies: [
      //     ...(state as UpcomingMoviesNotifierCompleteState).upcomingMovies,
      //     ...upcomingMovies,
      //   ],
      // ),
    );
    // });
  }
}

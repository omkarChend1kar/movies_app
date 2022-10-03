import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/service/usecases/get_top_rated_tv_shows_usecase.dart';
import 'package:movies_app/src/features/home/view/state/home_notifier.dart';
import 'package:movies_app/src/features/home/view/state/topratedtvshowslist/toprated_tv_shows_notfier_state.dart';

class TopRatedTvShowsNotifierImpl
    extends StateNotifier<TopRatedTvShowsNotifierState>
    implements TopRatedTvShowsNotifier {
  final GetTopRatedTvShowsUsecase getTopRatedTvShowsUsecase;
  TopRatedTvShowsNotifierImpl({required this.getTopRatedTvShowsUsecase})
      : super(TopRatedTvShowsNotifierInitialState()) {
    ///
    notifyTvEntityList();
  }

  @override
  @override
  notifyTvEntityList() {
    ///
    final response = getTopRatedTvShowsUsecase(
      Params(
        page: state is TopRatedTvShowsNotifierInitialState
            ? (state as TopRatedTvShowsNotifierInitialState).page
            : (state as TopRatedTvShowsNotifierCompleteState).page,
      ),
    );

    ///
    response!.then((value) {
      value.fold((l) => TopRatedTvShowsNotifierErrorState(failures: l), (tv) {
        state = TopRatedTvShowsNotifierCompleteState(
          page: state is TopRatedTvShowsNotifierInitialState
              ? (state as TopRatedTvShowsNotifierInitialState).page
              : (state as TopRatedTvShowsNotifierCompleteState).page + 1,
          topRatedTvShows: (state is TopRatedTvShowsNotifierInitialState)
              ? tv
              : [
                  ...(state as TopRatedTvShowsNotifierCompleteState)
                      .topRatedTvShows,
                  ...tv,
                ],
        );
      });
    });
  }
}

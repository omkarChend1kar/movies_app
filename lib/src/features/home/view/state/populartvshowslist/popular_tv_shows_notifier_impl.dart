import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/service/usecases/get_popular_tv_shows_usecase.dart';
import 'package:movies_app/src/features/home/view/state/home_notifier.dart';
import 'package:movies_app/src/features/home/view/state/populartvshowslist/popular_tv_shows_notifier_state.dart';

class PopularTvShowsNotifierImpl
    extends StateNotifier<PopularTvShowsNotifierState>
    implements PopularTvShowsNotifier {
  final GetPopularTvShowsUsecase getPopularTvShowsUsecase;
  PopularTvShowsNotifierImpl({required this.getPopularTvShowsUsecase})
      : super(PopularTvShowsNotifierInitialState()) {
    ///
    notifyTvEntityList();
  }

  @override
  notifyTvEntityList() {
    ///
    final response = getPopularTvShowsUsecase(
      Params(
        page: state is PopularTvShowsNotifierInitialState
            ? (state as PopularTvShowsNotifierInitialState).page
            : (state as PopularTvShowsNotifierCompleteState).page,
      ),
    );

    ///
    response!.then((value) {
      value.fold((l) => PopularTvShowsNotifierErrorState(failures: l), (tv) {
        state = PopularTvShowsNotifierCompleteState(
          page: state is PopularTvShowsNotifierInitialState
              ? (state as PopularTvShowsNotifierInitialState).page
              : (state as PopularTvShowsNotifierCompleteState).page + 1,
          popularTvShows: (state is PopularTvShowsNotifierInitialState)
              ? tv
              : [
                  ...(state as PopularTvShowsNotifierCompleteState)
                      .popularTvShows,
                  ...tv,
                ],
        );
      });
    });
  }
}

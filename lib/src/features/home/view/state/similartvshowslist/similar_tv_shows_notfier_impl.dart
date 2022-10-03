import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/service/usecases/get_similar_tv_shows_usecase.dart';
import 'package:movies_app/src/features/home/view/state/home_notifier.dart';
import 'package:movies_app/src/features/home/view/state/similartvshowslist/similar_tv_shows_notifier_state.dart';

class SimilarTvShowsNotifierImpl
    extends StateNotifier<SimilarTvShowsNotifierState>
    implements SimilarTvShowsNotifier {
  ///
  final GetSimilarTvShowsUsecase getSimilarTvShowsUsecase;

  ///
  SimilarTvShowsNotifierImpl({required this.getSimilarTvShowsUsecase})
      : super(SimilarTvShowsNotifierInitialState()) {
    ///
    state = SimilarTvShowsNotifierCompleteState();
  }

  @override
  notifyTvEntityList(int? id) {
    ///
    final response = getSimilarTvShowsUsecase(
      Params(
        id!,
        page: (state as SimilarTvShowsNotifierCompleteState).page,
      ),
    );

    ///
    response!.then((value) {
      value.fold(
        (l) => SimilarTvShowsNotifierErrorState(failures: l),
        (similarTvShows) =>
            (state as SimilarTvShowsNotifierCompleteState).copyWith(
          page: (state as SimilarTvShowsNotifierCompleteState).page + 1,
          similarTvShows: [
            ...(state as SimilarTvShowsNotifierCompleteState).similarTvShows,
            ...similarTvShows
          ],
        ),
      );
    });
  }
}

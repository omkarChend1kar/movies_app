import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/service/usecases/get_credits_for_movie_usecase.dart'
    as movie;
import 'package:movies_app/src/features/home/service/usecases/get_credits_for_tv_usecase.dart'
    as tv;
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_state.dart';
import 'package:movies_app/src/features/home/view/state/home_notifier.dart';

class CreditsListNotifierImpl extends StateNotifier<CreditsListNotifierState>
    implements CreditsNotifier {
  ///
  final movie.GetCreditsForMovieUsecase getCreditsForMovieUsecase;

  ///
  final tv.GetCreditsForTvUsecase getCreditsForTvUsecase;

  ///
  CreditsListNotifierImpl({
    required this.getCreditsForTvUsecase,
    required this.getCreditsForMovieUsecase,
  }) : super(CreditsListNotifierInitialState());

  @override
  notifyCreditsEntityListForMovies(int? id) async {
    ///
    final response = await getCreditsForMovieUsecase(movie.Params(id: id!));

    ///
    // response!.then((value) {
    response!.fold(
      (l) {
        state = CreditsListNotifierErrorState(failures: l);
      },
      (credits) {
        state = CreditsListNotifierCompleteState(credits: credits);
      },
    );
    // });
  }

  @override
  notifyCreditsEntityListForTv(int? id) {
    ///
    final response = getCreditsForTvUsecase(tv.Params(id: id!));

    ///
    response!.then((value) {
      value.fold(
        (l) => CreditsListNotifierErrorState(failures: l),
        (credits) => state = CreditsListNotifierCompleteState(credits: credits),
      );
    });
  }
}

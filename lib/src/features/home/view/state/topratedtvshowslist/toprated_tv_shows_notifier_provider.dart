import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';
import 'package:movies_app/src/features/home/view/state/topratedtvshowslist/toprated_tv_shows_notfier_state.dart';
import 'package:movies_app/src/features/home/view/state/topratedtvshowslist/toprated_tv_shows_notifier_impl.dart';

final topRatedTvShowsNotifierProvider = StateNotifierProvider<
    TopRatedTvShowsNotifierImpl, TopRatedTvShowsNotifierState>(
  (ref) => sl<TopRatedTvShowsNotifierImpl>(),
);

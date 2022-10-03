import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';
import 'package:movies_app/src/features/home/view/state/populartvshowslist/popular_tv_shows_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/populartvshowslist/popular_tv_shows_notifier_state.dart';

final popularTvShowsNotifierProvider = StateNotifierProvider<
    PopularTvShowsNotifierImpl, PopularTvShowsNotifierState>(
  (ref) => sl<PopularTvShowsNotifierImpl>(),
);

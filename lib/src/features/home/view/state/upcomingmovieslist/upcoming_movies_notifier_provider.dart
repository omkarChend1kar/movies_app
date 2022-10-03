import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';
import 'package:movies_app/src/features/home/view/state/upcomingmovieslist/upcoming_movies_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/upcomingmovieslist/upcoming_movies_notifier_state.dart';

///
final upcomingMoviesNotifierProvider = StateNotifierProvider<
    UpcomingMoviesNotifierImpl, UpcomingMoviesNotifierState>(
  (ref) => sl<UpcomingMoviesNotifierImpl>(),
);

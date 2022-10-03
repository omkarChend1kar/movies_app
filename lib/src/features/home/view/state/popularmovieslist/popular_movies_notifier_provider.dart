import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';
import 'package:movies_app/src/features/home/view/state/popularmovieslist/popular_movies_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/popularmovieslist/popular_movies_notifier_state.dart';

///
final popularMoviesNotifierProvider = StateNotifierProvider<
    PopularMoviesNotifierImpl, PopularMoviesNotifierState>(
  (ref) => sl<PopularMoviesNotifierImpl>(),
);

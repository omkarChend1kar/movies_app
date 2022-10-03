import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_impl.dart';
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_state.dart';

final creditsNotifierProvider =
    StateNotifierProvider<CreditsListNotifierImpl, CreditsListNotifierState>(
  (ref) => sl<CreditsListNotifierImpl>(),
);

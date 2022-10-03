import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_provider.dart';
import 'package:movies_app/src/features/home/view/state/creditslist/credits_list_notifier_state.dart';
import 'package:movies_app/src/features/home/view/widgets/build_poster_image.dart';

class CastDetails extends ConsumerWidget {
  const CastDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///

    ///
    final creditsState = ref.watch(creditsNotifierProvider);
    if (creditsState is CreditsListNotifierInitialState) {
      // return const CircularProgressIndicator();
    }
    if (creditsState is CreditsListNotifierCompleteState) {
      return SizedBox(
        height: 230,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: creditsState.credits.length,
          itemBuilder: (context, index) {
            final credits = creditsState.credits[index];

            ///
            final posterUrl =
                'https://image.tmdb.org/t/p/original/${credits.profilePath}';

            ///
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  buildPosterImage(posterUrl),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: 150,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            credits.originalName!,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            credits.characterName!,
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    }
    if (creditsState is CreditsListNotifierErrorState) {
      // return CircularProgressIndicator();
    }
    return const SizedBox();
  }
}

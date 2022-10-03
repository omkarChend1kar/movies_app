import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildPosterImage(String posterUrl) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 230,
        minWidth: 150,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          fadeInDuration: const Duration(seconds: 5),
          fadeInCurve: Curves.decelerate,
          placeholderFadeInDuration: const Duration(seconds: 10),
          placeholder: (context, url) {
            return ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 250,
                maxWidth: 150,
              ),
              child: Lottie.asset(
                'assets/animation/load-shimmer.json',
                fit: BoxFit.cover,
              ),
            );
          },
          imageUrl: posterUrl,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.error_outline_outlined,
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
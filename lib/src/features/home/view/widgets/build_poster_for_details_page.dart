import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildPosterForDetails(BuildContext context, String posterUrl) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      minWidth: MediaQuery.of(context).size.width,
      minHeight: MediaQuery.of(context).size.height * 0.4,
    ),
    child: Opacity(
      opacity: 0.5,
      child: Image.network(
        posterUrl,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrangeAccent,
                backgroundColor: Colors.grey.shade100,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Lottie.asset(
            'assets/animation/load-shimmer.json',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
          );
        },
      ),
    ),
  );
}

import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  ///
  final int? id;

  ///
  final String? posterPath;

  ///
  final String? overview;

  ///
  final String? releaseDate;

  ///
  final String? originalTitle;

  ///
  final String? originalLanguage;

  ///
  final String? backdropPath;

  ///
  final double? popularity;

  ///
  final int? voteCount;

  ///
  final List<dynamic>? genres;

  const MovieEntity({
    required this.id,
    required this.genres,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.originalTitle,
    required this.originalLanguage,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        voteCount,
      ];
}

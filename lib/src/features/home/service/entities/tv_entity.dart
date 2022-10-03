import 'package:equatable/equatable.dart';

class TvEntity extends Equatable {
  ///
  final int? id;

  ///
  final String? posterPath;

  ///
  final String? overview;

  ///
  final String? firstAirDate;

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

  ///
  final List<dynamic>? originCountry;

  const TvEntity({
    required this.originCountry,
    required this.id,
    required this.genres,
    required this.posterPath,
    required this.overview,
    required this.firstAirDate,
    required this.originalTitle,
    required this.originalLanguage,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        originCountry,
        backdropPath,
        genres,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        firstAirDate
      ];
}

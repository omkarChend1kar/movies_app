import 'package:movies_app/src/features/home/service/entities/tv_entity.dart';

class TvEntityModel extends TvEntity {
  const TvEntityModel({
    required super.originCountry,
    required super.id,
    required super.genres,
    required super.posterPath,
    required super.overview,
    required super.firstAirDate,
    required super.originalTitle,
    required super.originalLanguage,
    required super.backdropPath,
    required super.popularity,
    required super.voteCount,
  });

  factory TvEntityModel.fromJson(Map<String, dynamic> json) {
    return TvEntityModel(
      originCountry: json['origin_country'],
      id: json['id'],
      genres: json['genres'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      firstAirDate: json['first_air_date'],
      originalTitle: json['original_name'],
      originalLanguage: json['original_language'],
      backdropPath: json['backdrop_path'],
      popularity: (json['popularity'] as num).toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originCountry': originCountry,
      'id': id,
      'genres': genres,
      'posterPath': posterPath,
      'overview': overview,
      'firstAirDate': firstAirDate,
      'originalTitle': originalTitle,
      'originalLanguage': originalLanguage,
      'backdropPath': backdropPath,
      'popularity': popularity,
      'voteCount': voteCount,
    };
  }
}

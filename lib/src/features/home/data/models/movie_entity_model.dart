import 'package:movies_app/src/features/home/service/entities/movie_entity.dart';

class MovieEntityModel extends MovieEntity {
  const MovieEntityModel({
    required super.id,
    required super.genres,
    required super.posterPath,
    required super.overview,
    required super.releaseDate,
    required super.originalTitle,
    required super.originalLanguage,
    required super.backdropPath,
    required super.popularity,
    required super.voteCount,
  });

  ///
  factory MovieEntityModel.fromJson(Map<String, dynamic> json) {
    return MovieEntityModel(
      id: json['id'],
      genres: json['genres'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      originalTitle: json['original_title'],
      originalLanguage: json['original_language'],
      backdropPath: json['backdrop_path'],
      popularity: (json['popularity'] as num).toDouble(),
      voteCount: json['vote_count'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'genres': genres,
      'posterPath': posterPath,
      'overview': overview,
      'releaseDate': releaseDate,
      'originalTitle': originalTitle,
      'originalLanguage': originalLanguage,
      'backdropPath': backdropPath,
      'popularity': popularity,
      'voteCount': voteCount,
    };
  }
}

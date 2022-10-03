import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';

class CreditsEntityModel extends CreditsEntity {
  const CreditsEntityModel({
    required super.originalName,
    required super.characterName,
    required super.profilePath,
  });

  factory CreditsEntityModel.fromJson(Map<String, dynamic> json) {
    return CreditsEntityModel(
      originalName: json['original_name'],
      characterName: json['character'],
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalName': originalName ?? '',
      'characterName': characterName ?? '',
      'profilePath': profilePath ?? '',
    };
  }
}

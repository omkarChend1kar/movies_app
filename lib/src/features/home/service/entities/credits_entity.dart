import 'package:equatable/equatable.dart';

class CreditsEntity extends Equatable {
  ///
  final String? originalName;

  ///
  final String? characterName;

  ///
  final String? profilePath;

  const CreditsEntity({
    required this.originalName,
    required this.characterName,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [];
}

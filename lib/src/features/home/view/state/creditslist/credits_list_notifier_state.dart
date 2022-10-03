import 'package:equatable/equatable.dart';
import 'package:movies_app/src/core/utill/error/failures.dart';
import 'package:movies_app/src/features/home/service/entities/credits_entity.dart';

///
abstract class CreditsListNotifierState extends Equatable {}

///
class CreditsListNotifierInitialState extends CreditsListNotifierState {
  @override
  List<Object?> get props => [];
}

///
class CreditsListNotifierCompleteState extends CreditsListNotifierState {
  final List<CreditsEntity> credits;

  CreditsListNotifierCompleteState({
    required this.credits,
  });

  CreditsListNotifierCompleteState copyWith({
    List<CreditsEntity>? credits,
    int? page,
  }) {
    return CreditsListNotifierCompleteState(
      credits: credits ?? this.credits,
      // page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        credits,
      ];
}

///
class CreditsListNotifierErrorState extends CreditsListNotifierState {
  final Failures failures;

  CreditsListNotifierErrorState({required this.failures});
  @override
  List<Object?> get props => [failures];
}

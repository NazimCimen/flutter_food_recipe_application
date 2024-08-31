import 'package:equatable/equatable.dart';

//// extends from BaseFirebaseModel....
class RecipeStepEntity extends Equatable {
  final String? id;
  final int? stepNumber;
  final String? stepDescription;
  final String? stepImageUrl;

  const RecipeStepEntity({
    required this.id,
    required this.stepNumber,
    required this.stepDescription,
    required this.stepImageUrl,
  });
  RecipeStepEntity copyWith({
    int? stepNumber,
    String? id,
    String? stepDescription,
    String? stepImageUrl,
  }) {
    return RecipeStepEntity(
      id: id ?? this.id,
      stepNumber: stepNumber ?? this.stepNumber,
      stepDescription: stepDescription ?? this.stepDescription,
      stepImageUrl: stepImageUrl ?? this.stepImageUrl,
    );
  }

  @override
  List<Object?> get props => [id, stepNumber, stepDescription, stepImageUrl];
}

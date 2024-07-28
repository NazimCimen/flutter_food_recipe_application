import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class SetOnBoardShownUseCase {
  final OnBoardRepository repository;
  SetOnBoardShownUseCase(this.repository);

  Future<void> call() async {
    return repository.setOnBoardShown();
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'onboard_datas_use_case_test.mocks.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

@GenerateMocks([OnBoardRepository])
void main() {
  late SetOnBoardShownUseCase usecase;
  late MockOnBoardRepository mockOnBoardRepository;
  setUp(
    () {
      mockOnBoardRepository = MockOnBoardRepository();
      usecase = SetOnBoardShownUseCase(mockOnBoardRepository);
    },
  );
  test(
    'succes_set_onboard_shown_use_case',
    () async {
      //arrange
      when(mockOnBoardRepository.setOnBoardShown()).thenAnswer(
        (_) => Future.value(),
      );
      //act
      await usecase.call();
      //assert
      verify(mockOnBoardRepository.setOnBoardShown());
      verifyNoMoreInteractions(mockOnBoardRepository);
    },
  );
}

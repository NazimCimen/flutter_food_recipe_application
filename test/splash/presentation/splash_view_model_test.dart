import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'splash_view_model_test.mocks.dart';

@GenerateMocks([CheckCacheOnboardShownUseCase])
void main() {
  late SplashViewModel viewModel;
  late MockCheckCacheOnboardShownUseCase mockCheckCacheOnboardShownUseCase;

  setUp(
    () {
      mockCheckCacheOnboardShownUseCase = MockCheckCacheOnboardShownUseCase();
      viewModel = SplashViewModel(mockCheckCacheOnboardShownUseCase);
    },
  );
  tearDown(() {
    viewModel.dispose();
  });

  group(
    'succes/fail test splash view model',
    () {
      const testResult = false;
      final testFail = CacheFailure(errorMessage: '');
      test(
        'succes test splash view model ',
        () async {
          //arrange
          when(mockCheckCacheOnboardShownUseCase.call()).thenAnswer(
            (_) async => const Right(testResult),
          );
          //act
          await viewModel.checkSplashShown();

          //assert
          expect(viewModel.onBoardShown, testResult);
          verify(mockCheckCacheOnboardShownUseCase.call());
          verifyNoMoreInteractions(mockCheckCacheOnboardShownUseCase);
        },
      );
      test(
        'fail test splash view model ',
        () async {
          //arrange
          when(mockCheckCacheOnboardShownUseCase.call()).thenAnswer(
            (_) async => Left(testFail),
          );
          //act
          await viewModel.checkSplashShown();

          //assert
          expect(viewModel.onBoardShown, testResult);
          verify(mockCheckCacheOnboardShownUseCase.call());
          verifyNoMoreInteractions(mockCheckCacheOnboardShownUseCase);
        },
      );
    },
  );
}

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

  group(
    'success/fail test splash view model',
    () {
      const testResult = true;
      final testFail = CacheFailure(errorMessage: '');
      test(
        'success test splash view model',
        () async {
          // arrange
          when(mockCheckCacheOnboardShownUseCase.call()).thenAnswer(
            (_) async => const Right(testResult),
          );
          // act
          final result = await viewModel.checkOnboardShown();

          // assert
          expect(result, testResult);
          verify(mockCheckCacheOnboardShownUseCase.call());
          verifyNoMoreInteractions(mockCheckCacheOnboardShownUseCase);
        },
      );

      test(
        'fail test splash view model',
        () async {
          // arrange
          when(mockCheckCacheOnboardShownUseCase.call()).thenAnswer(
            (_) async => Left(testFail),
          );
          // act
          final result = await viewModel.checkOnboardShown();

          // assert
          expect(result, false);
          verify(mockCheckCacheOnboardShownUseCase.call());
          verifyNoMoreInteractions(mockCheckCacheOnboardShownUseCase);
        },
      );
    },
  );
}

import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'splash_repository_test.mocks.dart';

@GenerateMocks([SplashRepository])
void main() {
  late MockSplashRepository mockSplashRepository;
  late GetAppDatabaseVersionNumberUseCase usercase;

  setUp(
    () {
      mockSplashRepository = MockSplashRepository();
      usercase = GetAppDatabaseVersionNumberUseCase(mockSplashRepository);
    },
  );
  group(
    'succes/fail test Get App Database Version Number Use Case',
    () {
      const testModel = AppVersionEntity('1.0.0');
      final testFail = ServerFailure(errorMessage: '');
      const platform = 'android';
      test(
        'succes test',
        () async {
          // arrange
          when(
            mockSplashRepository.getAppVersionNumberFromDatabase(
              platform: platform,
            ),
          ).thenAnswer(
            (_) async => const Right(testModel),
          );
          // act
          final result = await usercase.call(platform: platform);
          // assert
          // ignore: inference_failure_on_instance_creation
          expect(result, const Right(testModel));
          verify(
            mockSplashRepository.getAppVersionNumberFromDatabase(
              platform: platform,
            ),
          );
          verifyNoMoreInteractions(mockSplashRepository);
        },
      );
      test(
        'fail test',
        () async {
          // arrange
          when(
            mockSplashRepository.getAppVersionNumberFromDatabase(
              platform: platform,
            ),
          ).thenAnswer(
            (_) async => Left(testFail),
          );
          // act
          final result = await usercase.call(platform: platform);
          // assert
          // ignore: inference_failure_on_instance_creation
          expect(result, Left(testFail));
          verify(
            mockSplashRepository.getAppVersionNumberFromDatabase(
              platform: platform,
            ),
          );
          verifyNoMoreInteractions(mockSplashRepository);
        },
      );
    },
  );
}

import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_repository_impl_test.mocks.dart';

@GenerateMocks([SplashLocalDataSource])
void main() {
  late SplashRepositoryImpl splashRepositoryImpl;
  late MockSplashLocalDataSource mockSplashLocalDataSource;
  setUp(
    () {
      mockSplashLocalDataSource = MockSplashLocalDataSource();
      splashRepositoryImpl = SplashRepositoryImpl(mockSplashLocalDataSource);
    },
  );
  group(
    'succes/fail test splash repository impl',
    () {
      const testResult = false;
      test(
        'succes test',
        () async {
          //arrange
          when(mockSplashLocalDataSource.checkCacheOnboardShown()).thenAnswer(
            (_) async => testResult,
          );
          //act
          final result = await splashRepositoryImpl.checkCacheOnboardShown();
          //assert
          // ignore: inference_failure_on_instance_creation
          expect(result, const Right(testResult));
        },
      );
      test(
        'fail test',
        () async {
          //arrange
          when(mockSplashLocalDataSource.checkCacheOnboardShown())
              .thenThrow(CacheException());
          //act
          final result = await splashRepositoryImpl.checkCacheOnboardShown();
          //assert
          expect(result.isLeft(), isTrue);
          result.fold(
            (failure) {
              expect(failure, isA<CacheFailure>());
            },
            (_) => fail('Should not reach here'),
          );
          verify(mockSplashLocalDataSource.checkCacheOnboardShown());
          verifyNoMoreInteractions(mockSplashLocalDataSource);
        },
      );
    },
  );
}

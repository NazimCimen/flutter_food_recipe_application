import 'dart:ui';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'onboard_repository_impl_test.mocks.dart';

@GenerateMocks([OnBoardLocalDataSource])
void main() {
  late MockOnBoardLocalDataSource mockOnBoardLocalDataSource;
  late OnBoardRepositoryImpl onBoardRepositoryImpl;

  setUp(
    () {
      mockOnBoardLocalDataSource = MockOnBoardLocalDataSource();
      onBoardRepositoryImpl =
          OnBoardRepositoryImpl(localDataSource: mockOnBoardLocalDataSource);
    },
  );

  group(
    'get_onboard_data',
    () {
      const tLocale = Locale('en');
      final tOnBoardDataModel = [
        OnBoardModel(
          description: 'description',
          title: 'title',
          imagePath: 'path',
        ),
      ];

      // Test 1: Success
      test(
        'success_get_onboard_data',
        () async {
          // Arrange
          when(
            mockOnBoardLocalDataSource.getOnBoardData(
              locale: anyNamed('locale'),
            ),
          ).thenAnswer((_) async => tOnBoardDataModel);

          // Act
          final result =
              await onBoardRepositoryImpl.getOnBoardDatas(locale: tLocale);

          // Assert
          // ignore: inference_failure_on_instance_creation
          expect(result, equals(Right(tOnBoardDataModel)));
          verify(mockOnBoardLocalDataSource.getOnBoardData(locale: tLocale));
          verifyNoMoreInteractions(mockOnBoardLocalDataSource);
        },
      );

      // Test 2: Failure
      test(
        'should return CacheFailure when the call to local data source is unsuccessful',
        () async {
          // Arrange
          when(
            mockOnBoardLocalDataSource.getOnBoardData(
              locale: anyNamed('locale'),
            ),
          ).thenThrow(CacheException());

          // Act
          final result =
              await onBoardRepositoryImpl.getOnBoardDatas(locale: tLocale);

          // Assert
          expect(result.isLeft(), isTrue);
          result.fold(
            (failure) {
              expect(failure, isA<CacheFailure>());
            },
            (_) => fail('Should not reach here'),
          );
          verify(mockOnBoardLocalDataSource.getOnBoardData(locale: tLocale));
          verifyNoMoreInteractions(mockOnBoardLocalDataSource);
        },
      );
    },
  );

  group('set_onboard_shown', () {
    test('should call local data source to set onboard shown', () async {
      // Arrange
      when(mockOnBoardLocalDataSource.setOnBoardShown())
          .thenAnswer((_) async => Future.value());

      // Act
      await onBoardRepositoryImpl.setOnBoardShown();

      // Assert
      verify(mockOnBoardLocalDataSource.setOnBoardShown());
      verifyNoMoreInteractions(mockOnBoardLocalDataSource);
    });
  });
}

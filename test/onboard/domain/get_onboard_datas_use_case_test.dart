import 'dart:ui';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'onboard_datas_use_case_test.mocks.dart';

@GenerateMocks([OnBoardRepository])
void main() {
  late GetOnBoardDatasUseCase useCase;
  late MockOnBoardRepository mockOnBoardRepository;

  setUp(() {
    mockOnBoardRepository = MockOnBoardRepository();
    useCase = GetOnBoardDatasUseCase(mockOnBoardRepository);
  });
  group(
    'succes/fail test get onboard datas use case',
    () {
      const tLocale = Locale('en');
      const tOnBoardData = [
        OnBoardEntity(
          description: 'description',
          title: 'title',
          imagePath: 'path',
        ),
      ];

      test('succes test', () async {
        // arrange
        when(mockOnBoardRepository.getOnBoardDatas(locale: anyNamed('locale')))
            .thenAnswer((_) async => const Right(tOnBoardData));

        // act
        final result = await useCase.call(locale: tLocale);

        // assert
        // ignore: inference_failure_on_instance_creation
        expect(result, const Right(tOnBoardData));
        verify(mockOnBoardRepository.getOnBoardDatas(locale: tLocale));
        verifyNoMoreInteractions(mockOnBoardRepository);
      });

      test('fail test', () async {
        // arrange
        final cacheFailure = CacheFailure(errorMessage: 'error');
        when(mockOnBoardRepository.getOnBoardDatas(locale: anyNamed('locale')))
            .thenAnswer((_) async => Left(cacheFailure));

        // act
        final result = await useCase.call(locale: tLocale);

        // assert
        // ignore: inference_failure_on_instance_creation
        expect(result, Left(cacheFailure));
        verify(mockOnBoardRepository.getOnBoardDatas(locale: tLocale));
        verifyNoMoreInteractions(mockOnBoardRepository);
      });
    },
  );
}

import 'dart:ui';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'onboard_view_model_test.mocks.dart';

@GenerateMocks([GetOnBoardDatasUseCase, SetOnBoardShownUseCase])
void main() {
  late OnboardViewModel viewModel;
  late MockGetOnBoardDatasUseCase mockGetOnBoardDatasUseCase;
  late MockSetOnBoardShownUseCase mockSetOnBoardShownUseCase;

  setUp(() {
    mockGetOnBoardDatasUseCase = MockGetOnBoardDatasUseCase();
    mockSetOnBoardShownUseCase = MockSetOnBoardShownUseCase();
    viewModel = OnboardViewModel(
      getOnBoardDatasUseCase: mockGetOnBoardDatasUseCase,
      setOnBoardShownUseCase: mockSetOnBoardShownUseCase,
    );
  });

  group('succes/fail test onboard view model eitherFailureOrOnBoardDatas', () {
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
      when(mockGetOnBoardDatasUseCase.call(locale: anyNamed('locale')))
          .thenAnswer((_) async => Left(CacheFailure(errorMessage: 'error')));

      // act
      await viewModel.eitherFailureOrOnBoardDatas(locale: tLocale);

      // assert
      expect(viewModel.failure, isA<Failure>());
      verify(mockGetOnBoardDatasUseCase.call(locale: tLocale));
    });

    test('fail test', () async {
      // arrange
      when(mockGetOnBoardDatasUseCase.call(locale: anyNamed('locale')))
          .thenAnswer((_) async => const Right(tOnBoardData));

      // act
      await viewModel.eitherFailureOrOnBoardDatas(locale: tLocale);

      // assert
      expect(viewModel.onBoardDatas, tOnBoardData);
      verify(mockGetOnBoardDatasUseCase.call(locale: tLocale));
      verifyNoMoreInteractions(mockGetOnBoardDatasUseCase);
    });
  });

  group('succes/fail test onboard view model setOnBoardShown', () {
    test('succes', () async {
      // arrange
      when(mockSetOnBoardShownUseCase.call())
          .thenAnswer((_) async => Future.value());

      // act
      await viewModel.setOnBoardShown();

      // assert
      verify(mockSetOnBoardShownUseCase.call());
    });
  });
}

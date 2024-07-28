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
      getOnBoardDatas: mockGetOnBoardDatasUseCase,
      setOnBoardShownUseCase: mockSetOnBoardShownUseCase,
    );
  });

  group('eitherFailureOrOnBoardDatas', () {
    const tLocale = Locale('en');
    const tOnBoardData = [
      OnBoardEntity(
        description: 'description',
        title: 'title',
        imagePath: 'path',
      ),
    ];

    test('should set failure when use case returns a failure', () async {
      // arrange
      when(mockGetOnBoardDatasUseCase.call(locale: anyNamed('locale')))
          .thenAnswer((_) async => Left(CacheFailure(errorMessage: 'error')));

      // act
      await viewModel.eitherFailureOrOnBoardDatas(locale: tLocale);

      // assert
      expect(viewModel.failure, isA<Failure>());
      verify(mockGetOnBoardDatasUseCase.call(locale: tLocale));
    });

    test('should set onBoardDatas when use case returns data', () async {
      // arrange
      when(mockGetOnBoardDatasUseCase.call(locale: anyNamed('locale')))
          .thenAnswer((_) async => const Right(tOnBoardData));

      // act
      await viewModel.eitherFailureOrOnBoardDatas(locale: tLocale);

      // assert
      expect(viewModel.onBoardDatas, tOnBoardData);
      verify(mockGetOnBoardDatasUseCase.call(locale: tLocale));
    });
  });

  group('setOnBoardShown', () {
    test('should call use case to set onboard shown', () async {
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

import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'auth_view_model_test.mocks.dart';

@GenerateMocks([
  SigninUserUseCase,
  SignupUserUseCase,
  SigninWithGoogleUserUseCase,
  SigninWithAppleUserUseCase,
])
void main() {
  late AuthViewModel viewModel;
  late MockSigninUserUseCase mockSigninUserUseCase;
  late MockSignupUserUseCase mockSignupUserUseCase;
  late MockSigninWithGoogleUserUseCase mockSigninWithGoogleUserUseCase;
  late MockSigninWithAppleUserUseCase mockSigninWithAppleUserUseCase;

  setUp(
    () {
      mockSigninUserUseCase = MockSigninUserUseCase();
      mockSignupUserUseCase = MockSignupUserUseCase();
      mockSigninWithGoogleUserUseCase = MockSigninWithGoogleUserUseCase();
      mockSigninWithAppleUserUseCase = MockSigninWithAppleUserUseCase();
      viewModel = AuthViewModel(
        signinUserUseCase: mockSigninUserUseCase,
        signupUserUseCase: mockSignupUserUseCase,
        signinWithGoogleUserUseCase: mockSigninWithGoogleUserUseCase,
        signinWithAppleUserUseCase: mockSigninWithAppleUserUseCase,
      );
    },
  );
  const tUserEntity =
      UserEntity(id: 'id', email: 'email', username: 'username');
  final tInputSigninModel = UserSigninInputModel(
    email: 'email',
    password: 'password',
  );
  final tInputSignupModel = UserSignUpInputModel(
    email: 'email',
    password: 'password',
    username: 'username',
  );
  final tFailure = ServerFailure(errorMessage: 'errorMessage');
  group(
    'succes/fail test auth view model signin user',
    () {
      test(
        'succes test',
        () async {
          //arrange
          when(
            mockSigninUserUseCase.call(signInInputModel: tInputSigninModel),
          ).thenAnswer(
            (_) async => const Right(tUserEntity),
          );
          //act
          await viewModel.signinUser(signInInputModel: tInputSigninModel);
          //assert
          expect(viewModel.user, tUserEntity);
          verify(
            mockSigninUserUseCase.call(signInInputModel: tInputSigninModel),
          );
          verifyNoMoreInteractions(mockSigninUserUseCase);
        },
      );

      test(
        'fail test',
        () async {
          //arrange
          when(
            mockSigninUserUseCase.call(signInInputModel: tInputSigninModel),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          //act
          await viewModel.signinUser(signInInputModel: tInputSigninModel);
          //assert
          expect(viewModel.failure, tFailure);
          verify(
            mockSigninUserUseCase.call(signInInputModel: tInputSigninModel),
          );
          verifyNoMoreInteractions(mockSigninUserUseCase);
        },
      );
    },
  );
  group(
    'succes/fail test auth view model signup user',
    () {
      test(
        'succes test',
        () async {
          //arrange
          when(
            mockSignupUserUseCase.call(signUpInputModel: tInputSignupModel),
          ).thenAnswer(
            (_) async => const Right(tUserEntity),
          );
          //act
          await viewModel.signupUser(signUpInputModel: tInputSignupModel);
          //assert
          expect(viewModel.user, tUserEntity);
          verify(
            mockSignupUserUseCase.call(signUpInputModel: tInputSignupModel),
          );
          verifyNoMoreInteractions(mockSigninUserUseCase);
        },
      );

      test(
        'fail test',
        () async {
          //arrange
          when(
            mockSignupUserUseCase.call(signUpInputModel: tInputSignupModel),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          //act
          await viewModel.signupUser(signUpInputModel: tInputSignupModel);
          //assert
          expect(viewModel.failure, tFailure);
          verify(
            mockSignupUserUseCase.call(signUpInputModel: tInputSignupModel),
          );
          verifyNoMoreInteractions(mockSignupUserUseCase);
        },
      );
    },
  );
  group(
    'succes/fail test auth view model sign in with google user',
    () {
      test(
        'succes test',
        () async {
          //arrange
          when(
            mockSigninWithGoogleUserUseCase.call(),
          ).thenAnswer(
            (_) async => const Right(tUserEntity),
          );
          //act
          await viewModel.signinWithGoogle();
          //assert
          expect(viewModel.user, tUserEntity);
          verify(
            mockSigninWithGoogleUserUseCase.call(),
          );
          verifyNoMoreInteractions(mockSigninWithGoogleUserUseCase);
        },
      );

      test(
        'fail test',
        () async {
          //arrange
          when(
            mockSigninWithGoogleUserUseCase.call(),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          //act
          await viewModel.signinWithGoogle();
          //assert
          expect(viewModel.failure, tFailure);
          verify(
            mockSigninWithGoogleUserUseCase.call(),
          );
          verifyNoMoreInteractions(mockSigninWithGoogleUserUseCase);
        },
      );
    },
  );
}

import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late AuthRepositoryImpl authRepositoryImpl;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    authRepositoryImpl =
        AuthRepositoryImpl(remoteDataSource: mockAuthRemoteDataSource);
  });

  const tUserModel =
      UserModel(userId: 'id', email: 'email', username: 'username');
  const tUserEntity =
      UserEntity(userId: 'id', email: 'email', username: 'username');
  final tInputSigninModel =
      UserSigninInputModel(email: 'email', password: 'password');
  final tInputSignupModel = UserSignUpInputModel(
    email: 'email',
    password: 'password',
    username: 'username',
  );
  final tFailure = ServerFailure(errorMessage: 'errorMessage');

  group('success/fail test AuthRepositoryImpl signinUser', () {
    test('success test', () async {
      // Arrange
      when(
        mockAuthRemoteDataSource.signinUser(
          signInInputModel: tInputSigninModel,
        ),
      ).thenAnswer((_) async => const Right(tUserModel));

      // Act
      final result = await authRepositoryImpl.signinUser(
        signinInputModel: tInputSigninModel,
      );

      // Assert
      // ignore: inference_failure_on_instance_creation
      expect(result, const Right(tUserEntity));
      verify(
        mockAuthRemoteDataSource.signinUser(
          signInInputModel: tInputSigninModel,
        ),
      );
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });

    test('failure test', () async {
      // Arrange
      when(
        mockAuthRemoteDataSource.signinUser(
          signInInputModel: tInputSigninModel,
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await authRepositoryImpl.signinUser(
        signinInputModel: tInputSigninModel,
      );

      // Assert
      // ignore: inference_failure_on_instance_creation
      expect(result, Left(tFailure));
      verify(
        mockAuthRemoteDataSource.signinUser(
          signInInputModel: tInputSigninModel,
        ),
      );
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });
  });

  group('success/fail test AuthRepositoryImpl signupUser', () {
    test('success test', () async {
      // Arrange
      when(
        mockAuthRemoteDataSource.signupUser(
          signUpInputModel: tInputSignupModel,
        ),
      ).thenAnswer((_) async => const Right(tUserModel));

      // Act
      final result = await authRepositoryImpl.signupUser(
        signUpInputModel: tInputSignupModel,
      );

      // Assert
      // ignore: inference_failure_on_instance_creation
      expect(result, const Right(tUserEntity));
      verify(
        mockAuthRemoteDataSource.signupUser(
          signUpInputModel: tInputSignupModel,
        ),
      );
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });

    test('failure test', () async {
      // Arrange
      when(
        mockAuthRemoteDataSource.signupUser(
          signUpInputModel: tInputSignupModel,
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await authRepositoryImpl.signupUser(
        signUpInputModel: tInputSignupModel,
      );

      // Assert
      // ignore: inference_failure_on_instance_creation
      expect(result, Left(tFailure));
      verify(
        mockAuthRemoteDataSource.signupUser(
          signUpInputModel: tInputSignupModel,
        ),
      );
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });
  });
  group('success/fail test AuthRepositoryImpl signWithGoogle', () {
    test('success test', () async {
      // Arrange
      when(
        mockAuthRemoteDataSource.signinWithGoogleUser(),
      ).thenAnswer((_) async => const Right(tUserModel));

      // Act
      final result = await authRepositoryImpl.signinWithGoogleUser();

      // Assert
      // ignore: inference_failure_on_instance_creation
      expect(result, const Right(tUserEntity));
      verify(
        mockAuthRemoteDataSource.signinWithGoogleUser(),
      );
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });

    test('failure test', () async {
      // Arrange
      when(
        mockAuthRemoteDataSource.signinWithGoogleUser(),
      ).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await authRepositoryImpl.signinWithGoogleUser();

      // Assert
      // ignore: inference_failure_on_instance_creation
      expect(result, Left(tFailure));
      verify(
        mockAuthRemoteDataSource.signinWithGoogleUser(),
      );
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });
  });
}

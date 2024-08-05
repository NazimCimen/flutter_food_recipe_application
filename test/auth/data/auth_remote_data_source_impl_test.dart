import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  GoogleSignIn,
  INetworkInfo,
  IErrorMapper,
  UserCredential,
  User,
  GoogleSignInAccount,
  GoogleSignInAuthentication,
])
void main() {
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockINetworkInfo mockINetworkInfo;
  late MockIErrorMapper mockIErrorMapper;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late MockGoogleSignInAccount mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication mockGoogleSignInAuthentication;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    mockINetworkInfo = MockINetworkInfo();
    mockIErrorMapper = MockIErrorMapper();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();

    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(
      auth: mockFirebaseAuth,
      googleSignIn: mockGoogleSignIn,
      networkInfo: mockINetworkInfo,
      errorMapper: mockIErrorMapper,
    );
  });

  const tUserModel =
      UserModel(userId: 'id', email: 'email', username: 'username');
  final tInputSigninModel =
      UserSigninInputModel(email: 'email', password: 'password');
  final tInputSignupModel = UserSignUpInputModel(
    email: 'email',
    password: 'password',
    username: 'username',
  );

  group('signinUser', () {
    test('should return UserModel when signin is successful', () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => true);
      when(
        mockFirebaseAuth.signInWithEmailAndPassword(
          email: tInputSigninModel.email,
          password: tInputSigninModel.password,
        ),
      ).thenAnswer((_) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn('id');
      when(mockUser.email).thenReturn('email');
      when(mockUser.displayName).thenReturn('username');

      // Act
      final result = await authRemoteDataSourceImpl.signinUser(
        signInInputModel: tInputSigninModel,
      );

      // Assert
      // ignore: inference_failure_on_instance_creation
      expect(result, const Right(tUserModel));
      verify(
        mockFirebaseAuth.signInWithEmailAndPassword(
          email: tInputSigninModel.email,
          password: tInputSigninModel.password,
        ),
      );
    });

    test('should return Failure when there is no internet connection',
        () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => false);

      // Act
      final result = await authRemoteDataSourceImpl.signinUser(
        signInInputModel: tInputSigninModel,
      );

      // Assert
      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
        },
        (_) => fail('Should not reach here'),
      );
      verify(mockINetworkInfo.currentConnectivityResult);
      verifyZeroInteractions(mockFirebaseAuth);
    });
    test('should return Failure when FirebaseAuthException is thrown',
        () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => true);
      when(
        mockFirebaseAuth.signInWithEmailAndPassword(
          email: tInputSigninModel.email,
          password: tInputSigninModel.password,
        ),
      ).thenThrow(FirebaseAuthException(code: 'user-not-found'));

      when(mockIErrorMapper.mapFirebaseAuthExceptionToMessage(any))
          .thenReturn('User not found');

      // Act
      final result = await authRemoteDataSourceImpl.signinUser(
        signInInputModel: tInputSigninModel,
      );

      // Assert
      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
        },
        (_) => fail('Should not reach here'),
      );
      verify(
        mockFirebaseAuth.signInWithEmailAndPassword(
          email: tInputSigninModel.email,
          password: tInputSigninModel.password,
        ),
      );
    });
  });

  group('signupUser', () {
    test('should return UserModel when signup is successful', () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => true);
      when(
        mockFirebaseAuth.createUserWithEmailAndPassword(
          email: tInputSignupModel.email,
          password: tInputSignupModel.password,
        ),
      ).thenAnswer((_) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn('id');
      when(mockUser.email).thenReturn('email');
      when(mockUser.displayName).thenReturn('username');

      // Act
      final result = await authRemoteDataSourceImpl.signupUser(
        signUpInputModel: tInputSignupModel,
      );

      // Assert
      // ignore: inference_failure_on_instance_creation
      expect(result, const Right(tUserModel));
      verify(
        mockFirebaseAuth.createUserWithEmailAndPassword(
          email: tInputSignupModel.email,
          password: tInputSignupModel.password,
        ),
      );
      verify(mockUser.updateDisplayName(tInputSignupModel.username));
    });

    test('should return Failure when there is no internet connection',
        () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => false);

      // Act
      final result = await authRemoteDataSourceImpl.signupUser(
        signUpInputModel: tInputSignupModel,
      );

      // Assert
      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
        },
        (_) => fail('Should not reach here'),
      );
      verify(mockINetworkInfo.currentConnectivityResult);
      verifyZeroInteractions(mockFirebaseAuth);
    });

    test('should return Failure when FirebaseAuthException is thrown',
        () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => true);
      when(
        mockFirebaseAuth.createUserWithEmailAndPassword(
          email: tInputSignupModel.email,
          password: tInputSignupModel.password,
        ),
      ).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

      when(mockIErrorMapper.mapFirebaseAuthExceptionToMessage(any))
          .thenReturn('Email already in use');

      // Act
      final result = await authRemoteDataSourceImpl.signupUser(
        signUpInputModel: tInputSignupModel,
      );

      // Assert
      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
        },
        (_) => fail('Should not reach here'),
      );
      verify(
        mockFirebaseAuth.createUserWithEmailAndPassword(
          email: tInputSignupModel.email,
          password: tInputSignupModel.password,
        ),
      );
    });
  });

  group('signinWithGoogleUser', () {
    test('should return UserModel when signin with Google is successful',
        () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => true);
      when(mockGoogleSignIn.signIn())
          .thenAnswer((_) async => mockGoogleSignInAccount);
      when(mockGoogleSignInAccount.authentication)
          .thenAnswer((_) async => mockGoogleSignInAuthentication);
      when(mockGoogleSignInAuthentication.accessToken)
          .thenReturn('accessToken');
      when(mockGoogleSignInAuthentication.idToken).thenReturn('idToken');
      when(mockFirebaseAuth.signInWithCredential(any))
          .thenAnswer((_) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn('id');
      when(mockUser.email).thenReturn('email');
      when(mockUser.displayName).thenReturn('username');

      // Act
      final result = await authRemoteDataSourceImpl.signinWithGoogleUser();

      // Assert
      // ignore: inference_failure_on_instance_creation
      expect(result, const Right(tUserModel));
      verify(mockGoogleSignIn.signIn());
      verify(mockFirebaseAuth.signInWithCredential(any));
    });

    test('should return Failure when there is no internet connection',
        () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => false);

      // Act
      final result = await authRemoteDataSourceImpl.signinWithGoogleUser();

      // Assert
      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
        },
        (_) => fail('Should not reach here'),
      );
      verify(mockINetworkInfo.currentConnectivityResult);
      verifyZeroInteractions(mockGoogleSignIn);
    });

    test('should return Failure when signIn is aborted', () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => true);
      when(mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

      // Act
      final result = await authRemoteDataSourceImpl.signinWithGoogleUser();

      // Assert
      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
        },
        (_) => fail('Should not reach here'),
      );
      verify(mockGoogleSignIn.signIn());
    });

    test('should return Failure when FirebaseAuthException is thrown',
        () async {
      // Arrange
      when(mockINetworkInfo.currentConnectivityResult)
          .thenAnswer((_) async => true);
      when(mockGoogleSignIn.signIn())
          .thenAnswer((_) async => mockGoogleSignInAccount);
      when(mockGoogleSignInAccount.authentication)
          .thenAnswer((_) async => mockGoogleSignInAuthentication);
      when(mockGoogleSignInAuthentication.accessToken)
          .thenReturn('accessToken');
      when(mockGoogleSignInAuthentication.idToken).thenReturn('idToken');
      when(mockFirebaseAuth.signInWithCredential(any))
          .thenThrow(FirebaseAuthException(code: 'invalid-credential'));

      when(mockIErrorMapper.mapFirebaseAuthExceptionToMessage(any))
          .thenReturn('Invalid credential');

      // Act
      final result = await authRemoteDataSourceImpl.signinWithGoogleUser();

      // Assert
      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
        },
        (_) => fail('Should not reach here'),
      );
      verify(mockGoogleSignIn.signIn());
      verify(mockFirebaseAuth.signInWithCredential(any));
    });
  });
}

import 'package:flutter/foundation.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserModel>> signinUser({
    required UserSigninInputModel signInInputModel,
  });
  Future<Either<Failure, UserModel>> signupUser({
    required UserSignUpInputModel signUpInputModel,
  });
  Future<Either<Failure, UserModel>> signinWithGoogleUser();
  Future<Either<Failure, UserModel>> signinWithAppleUser();
}

@immutable
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  final INetworkInfo networkInfo;
  final IErrorMapper errorMapper;

  const AuthRemoteDataSourceImpl({
    required this.auth,
    required this.googleSignIn,
    required this.networkInfo,
    required this.errorMapper,
  });

  /// SIGN IN - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserModel>> signinUser({
    required UserSigninInputModel signInInputModel,
  }) async {
    if (!await networkInfo.currentConnectivityResult) {
      return Left(ServerFailure(errorMessage: 'No internet connection.'));
    }
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: signInInputModel.email,
        password: signInInputModel.password,
      );

      final user = userCredential.user;
      if (user != null) {
        return Right(UserModel.fromFirebaseUser(user));
      } else {
        return Left(ServerFailure(errorMessage: 'User ID is null'));
      }
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: errorMapper.mapFirebaseAuthExceptionToMessage(e),
        ),
      );
    }
  }

  /// SIGN UP - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserModel>> signupUser({
    required UserSignUpInputModel signUpInputModel,
  }) async {
    if (!await networkInfo.currentConnectivityResult) {
      return Left(ServerFailure(errorMessage: 'No internet connection.'));
    }
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: signUpInputModel.email,
        password: signUpInputModel.password,
      );

      final user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(signUpInputModel.username);
        return Right(UserModel.fromFirebaseUser(user));
      } else {
        return Left(ServerFailure(errorMessage: 'User ID is null'));
      }
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: errorMapper.mapFirebaseAuthExceptionToMessage(e),
        ),
      );
    }
  }

  /// SIGN IN WITH GOOGLE - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserModel>> signinWithGoogleUser() async {
    if (!await networkInfo.currentConnectivityResult) {
      return Left(
        ServerFailure(
          errorMessage: StringConstants.authErrorNoInternetConnection,
        ),
      );
    }
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return Left(
          ServerFailure(
            errorMessage: StringConstants.authErrorSignInAborted,
          ),
        );
      }
      final googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        return Right(UserModel.fromFirebaseUser(user));
      } else {
        return Left(
          ServerFailure(errorMessage: StringConstants.authErrorUserIdIsNull),
        );
      }
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: errorMapper.mapFirebaseAuthExceptionToMessage(e),
        ),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  /// SIGN IN WITH APPLE - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserModel>> signinWithAppleUser() async {
    if (!await networkInfo.currentConnectivityResult) {
      return Left(
        ServerFailure(
          errorMessage: StringConstants.authErrorNoInternetConnection,
        ),
      );
    }
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final AuthCredential credential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      final userCredential = await auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        return Right(UserModel.fromFirebaseUser(user));
      } else {
        return Left(
          ServerFailure(errorMessage: StringConstants.authErrorUserIdIsNull),
        );
      }
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: errorMapper.mapFirebaseAuthExceptionToMessage(e),
        ),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

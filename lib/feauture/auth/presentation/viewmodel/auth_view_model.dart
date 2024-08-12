import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class AuthViewModel extends ChangeNotifier {
  final SigninUserUseCase signinUserUseCase;
  final SignupUserUseCase signupUserUseCase;
  final SigninWithGoogleUserUseCase signinWithGoogleUserUseCase;
  final SigninWithAppleUserUseCase signinWithAppleUserUseCase;
  final CacheUserTokenUseCase cacheUserTokenUseCase;
  final FirebaseAuth auth;
  AuthViewModel({
    required this.signinUserUseCase,
    required this.signupUserUseCase,
    required this.signinWithGoogleUserUseCase,
    required this.signinWithAppleUserUseCase,
    required this.cacheUserTokenUseCase,
    required this.auth,
    this.failure,
    this.user,
  });

  Failure? failure;
  UserEntity? user;

  /// SIGN IN - RESULT: FAILURE OR USER OBJECT
  Future<void> signinUser({
    required UserSigninInputModel signInInputModel,
  }) async {
    final failureOrSignin =
        await signinUserUseCase.call(signInInputModel: signInInputModel);
    failureOrSignin.fold(
      (failure) {
        this.failure = failure;
        notifyListeners();
      },
      (user) {
        this.user = user;
        cacheUserAuthToken();
      },
    );
  }

  /// SIGN UP - RESULT: FAILURE OR USER OBJECT
  Future<void> signupUser({
    required UserSignUpInputModel signUpInputModel,
  }) async {
    final failureOrSignup = await signupUserUseCase.call(
      signUpInputModel: signUpInputModel,
    );
    failureOrSignup.fold(
      (failure) {
        this.failure = failure;
        notifyListeners();
      },
      (user) {
        this.user = user;
        cacheUserAuthToken();
      },
    );
  }

  /// SIGN WITH GOOGLE - RESULT: FAILURE OR USER OBJECT
  Future<void> signinWithGoogle() async {
    final failureOrSignin = await signinWithGoogleUserUseCase.call();
    failureOrSignin.fold(
      (failure) {
        this.failure = failure;
        notifyListeners();
      },
      (user) {
        this.user = user;
        cacheUserAuthToken();
      },
    );
  }

  /// SIGN WITH APPLE - RESULT: FAILURE OR USER OBJECT
  Future<void> signinWithApple() async {
    final failureOrSignin = await signinWithAppleUserUseCase.call();
    failureOrSignin.fold(
      (failure) {
        this.failure = failure;
        notifyListeners();
      },
      (user) {
        this.user = user;
        cacheUserAuthToken();
      },
    );
  }

  /// USED TO SAVE AUTH TOKEN IN LOCALE
  Future<void> cacheUserAuthToken() async {
    final currentUser = auth.currentUser;
    if (currentUser != null) {
      final userAuthToken = await currentUser.getIdToken();
      if (userAuthToken != null) {
        await cacheUserTokenUseCase.call(
          userIdToken: userAuthToken,
        );
      }
    }
  }

  /// USED TO CLEAN FAILURE
  void clearFailure() {
    failure = null;
    notifyListeners();
  }
}

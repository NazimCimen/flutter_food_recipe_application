import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_food_recipe_application/config/app_config_export.dart';

abstract class IErrorMapper {
  String mapFirebaseAuthExceptionToMessage(FirebaseAuthException e);
  String mapFailureToMessage(String e);
}

class ErrorMapper implements IErrorMapper {
  @override
  String mapFirebaseAuthExceptionToMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return StringConstants.authErrorInvalidMail;
      case 'user-not-found':
        return StringConstants.authErrorUserNotFound;
      case 'wrong-password':
        return StringConstants.authErrorWrongPassword;
      case 'email-already-in-use':
        return StringConstants.authErrorEmailAlreadyInUse;
      case 'user-disabled':
        return StringConstants.authErrorUserDisabled;
      case 'operation-not-allowed':
        return StringConstants.authErrorOperationNotAllowed;
      case 'weak-password':
        return StringConstants.authErrorWeakPassword;
      case 'account-exists-with-different-credential':
        return StringConstants.authErrorAccountExixstWithDifferantCredential;
      case 'invalid-credential':
        return StringConstants.authErrorInvalidCredential;
      case 'requires-recent-login':
        return StringConstants.authErrorRequiredRecentLogin;
      default:
        return StringConstants.authErrorUnknown;
    }
  }

  @override
  String mapFailureToMessage(String e) {
    // TODO: implement mapFailureToMessage
    throw UnimplementedError();
  }
}

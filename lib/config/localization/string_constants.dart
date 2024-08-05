import 'package:flutter_food_recipe_application/config/app_config_export.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class StringConstants {
  StringConstants._();

  // Onboard
  static String get skip => 'onboard.skip'.tr();

  // Auth - Login
  static String get loginTitle => 'auth.login.title'.tr();
  static String get loginSubtitle => 'auth.login.subtitle'.tr();
  static String get dontHaveAccount => 'auth.login.dontHaveAccount'.tr();
  static String get signUp => 'auth.login.signUp'.tr();
  static String get email => 'auth.login.email'.tr();
  static String get password => 'auth.login.password'.tr();
  static String get forgotPassword => 'auth.login.forgotPassword'.tr();
  static String get loginButton => 'auth.login.loginButton'.tr();
  static String get continueWithGoogle => 'auth.login.continueWithGoogle'.tr();
  static String get continueWithApple => 'auth.login.continueWithApple'.tr();
  static String get or => 'auth.login.or'.tr();

  // Auth - Signup
  static String get signUpTitle => 'auth.signup.title'.tr();
  static String get signUpSubtitle => 'auth.signup.subtitle'.tr();
  static String get alreadyHaveAccount => 'auth.signup.alreadyHaveAccount'.tr();
  static String get login => 'auth.signup.login'.tr();
  static String get username => 'auth.signup.username'.tr();
  static String get signUpButton => 'auth.signup.signUpButton'.tr();

  // Auth - Errors
  static String get authErrorInvalidMail => 'auth.errors.invalid-email'.tr();
  static String get authErrorUserNotFound => 'auth.errors.user-not-found'.tr();
  static String get authErrorWrongPassword => 'auth.errors.wrong-password'.tr();
  static String get authErrorEmailAlreadyInUse =>
      'auth.errors.email-already-in-use'.tr();
  static String get authErrorUserDisabled => 'auth.errors.user-disabled'.tr();
  static String get authErrorOperationNotAllowed =>
      'auth.errors.operation-not-allowed'.tr();
  static String get authErrorWeakPassword => 'auth.errors.weak-password'.tr();
  static String get authErrorAccountExixstWithDifferantCredential =>
      'auth.errors.account-exists-with-different-credential'.tr();
  static String get authErrorInvalidCredential =>
      'auth.errors.invalid-credential'.tr();
  static String get authErrorRequiredRecentLogin =>
      'auth.errors.requires-recent-login'.tr();
  static String get authErrorUnknown => 'auth.errors.unknown'.tr();
  static String get authErrorNoInternetConnection =>
      'auth.errors.no-internet-connection'.tr();
  static String get authErrorUserIdIsNull => 'auth.errors.user-id-is-null'.tr();
  static String get authErrorSignInAborted =>
      'auth.errors.sign-in-aborted'.tr();
}

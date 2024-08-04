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
}

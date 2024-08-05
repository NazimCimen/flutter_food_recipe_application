import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'auth_repository_mock.dart';

@GenerateMocks([AuthRepository])
void main() {
  late SigninUserUseCase signinUserUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(
    () {
      mockAuthRepository = MockAuthRepository();
      signinUserUseCase = SigninUserUseCase(mockAuthRepository);
    },
  );
  const tUserEntity =
      UserEntity(userId: 'id', email: 'email', username: 'username');
  final tInputSigninModel = UserSigninInputModel(
    email: 'email',
    password: 'password',
  );
  final tFailure = ServerFailure(errorMessage: 'errorMessage');

  group(
    'succes/fail test signinUserUseCase',
    () {
      test(
        'succes test',
        () async {
          //arrange
          when(
            mockAuthRepository.signinUser(
              signinInputModel: tInputSigninModel,
            ),
          ).thenAnswer(
            (_) async => const Right(tUserEntity),
          );
          //act
          final result =
              await signinUserUseCase.call(signInInputModel: tInputSigninModel);
          //assert
          // ignore: inference_failure_on_instance_creation
          expect(result, const Right(tUserEntity));
          verify(
            mockAuthRepository.signinUser(
              signinInputModel: tInputSigninModel,
            ),
          );
          verifyNoMoreInteractions(mockAuthRepository);
        },
      );
      test(
        'fail test',
        () async {
          //arrange
          when(
            mockAuthRepository.signinUser(signinInputModel: tInputSigninModel),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          //act
          final result =
              await signinUserUseCase.call(signInInputModel: tInputSigninModel);
          //assert
          // ignore: inference_failure_on_instance_creation
          expect(result, Left(tFailure));
          verify(
            mockAuthRepository.signinUser(
              signinInputModel: tInputSigninModel,
            ),
          );
          verifyNoMoreInteractions(mockAuthRepository);
        },
      );
    },
  );
}

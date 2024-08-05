// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_food_recipe_application/test/auth/presentation/auth_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthRepository_0 extends _i1.SmartFake
    implements _i2.AuthRepository {
  _FakeAuthRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SigninUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSigninUserUseCase extends _i1.Mock implements _i2.SigninUserUseCase {
  MockSigninUserUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeAuthRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.AuthRepository);

  @override
  _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>> call(
          {required _i2.UserSigninInputModel? signInInputModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#signInInputModel: signInInputModel},
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>.value(
            _FakeEither_1<_i2.Failure, _i2.UserEntity>(
          this,
          Invocation.method(
            #call,
            [],
            {#signInInputModel: signInInputModel},
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>);
}

/// A class which mocks [SignupUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignupUserUseCase extends _i1.Mock implements _i2.SignupUserUseCase {
  MockSignupUserUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeAuthRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.AuthRepository);

  @override
  _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>> call(
          {required _i2.UserSignUpInputModel? signUpInputModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#signUpInputModel: signUpInputModel},
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>.value(
            _FakeEither_1<_i2.Failure, _i2.UserEntity>(
          this,
          Invocation.method(
            #call,
            [],
            {#signUpInputModel: signUpInputModel},
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>);
}

/// A class which mocks [SigninWithGoogleUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSigninWithGoogleUserUseCase extends _i1.Mock
    implements _i2.SigninWithGoogleUserUseCase {
  MockSigninWithGoogleUserUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeAuthRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.AuthRepository);

  @override
  _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>.value(
            _FakeEither_1<_i2.Failure, _i2.UserEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>);
}

/// A class which mocks [SigninWithAppleUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSigninWithAppleUserUseCase extends _i1.Mock
    implements _i2.SigninWithAppleUserUseCase {
  MockSigninWithAppleUserUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeAuthRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.AuthRepository);

  @override
  _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>.value(
            _FakeEither_1<_i2.Failure, _i2.UserEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>);
}

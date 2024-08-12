// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_food_recipe_application/test/auth/domain/signup_user_use_case_test.dart.
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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i2.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>> signinUser(
          {required _i2.UserSigninInputModel? signinInputModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #signinUser,
          [],
          {#signinInputModel: signinInputModel},
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>.value(
            _FakeEither_0<_i2.Failure, _i2.UserEntity>(
          this,
          Invocation.method(
            #signinUser,
            [],
            {#signinInputModel: signinInputModel},
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>);

  @override
  _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>> signupUser(
          {required _i2.UserSignUpInputModel? signUpInputModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #signupUser,
          [],
          {#signUpInputModel: signUpInputModel},
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>.value(
            _FakeEither_0<_i2.Failure, _i2.UserEntity>(
          this,
          Invocation.method(
            #signupUser,
            [],
            {#signUpInputModel: signUpInputModel},
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>);

  @override
  _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>> signinWithGoogleUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #signinWithGoogleUser,
          [],
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>.value(
            _FakeEither_0<_i2.Failure, _i2.UserEntity>(
          this,
          Invocation.method(
            #signinWithGoogleUser,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>);

  @override
  _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>> signinWithAppleUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #signinWithAppleUser,
          [],
        ),
        returnValue: _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>.value(
            _FakeEither_0<_i2.Failure, _i2.UserEntity>(
          this,
          Invocation.method(
            #signinWithAppleUser,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, _i2.UserEntity>>);

  @override
  _i3.Future<void> cacheUserToken({required String? userIdToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheUserToken,
          [],
          {#userIdToken: userIdToken},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

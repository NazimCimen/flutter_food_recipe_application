// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_food_recipe_application/test/onboard/presentation/onboard_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:ui' as _i4;

import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart'
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

class _FakeOnBoardRepository_0 extends _i1.SmartFake
    implements _i2.OnBoardRepository {
  _FakeOnBoardRepository_0(
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

/// A class which mocks [GetOnBoardDatasUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetOnBoardDatasUseCase extends _i1.Mock
    implements _i2.GetOnBoardDatasUseCase {
  MockGetOnBoardDatasUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.OnBoardRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeOnBoardRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.OnBoardRepository);

  @override
  _i3.Future<_i2.Either<_i2.Failure, List<_i2.OnBoardEntity>>> call(
          {required _i4.Locale? locale}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#locale: locale},
        ),
        returnValue:
            _i3.Future<_i2.Either<_i2.Failure, List<_i2.OnBoardEntity>>>.value(
                _FakeEither_1<_i2.Failure, List<_i2.OnBoardEntity>>(
          this,
          Invocation.method(
            #call,
            [],
            {#locale: locale},
          ),
        )),
      ) as _i3.Future<_i2.Either<_i2.Failure, List<_i2.OnBoardEntity>>>);
}

/// A class which mocks [SetOnBoardShownUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSetOnBoardShownUseCase extends _i1.Mock
    implements _i2.SetOnBoardShownUseCase {
  MockSetOnBoardShownUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.OnBoardRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeOnBoardRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.OnBoardRepository);

  @override
  _i3.Future<void> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

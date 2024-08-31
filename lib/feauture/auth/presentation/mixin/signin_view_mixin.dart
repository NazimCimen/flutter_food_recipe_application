import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter/material.dart';

mixin SigninViewMixin on State<SigninView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late AppValidators validators;
  bool isRequestAvaible = false;
  AutovalidateMode isAutoValidateSignin = AutovalidateMode.disabled;
  bool obsecureText = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    validators = AppValidators();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ///it used to show failures in SnackBar and it overrides in view.
  void showScaffoldSnackBar({required Failure? failure});

  /// it works when user click sign in button
  Future<void> signinButtonOnPressed() async {
    FocusScope.of(context).unfocus();
    validateFields();
    if (isRequestAvaible) {
      await signinUser(
        signInInputModel: UserSigninInputModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      makeFalseIsRequestAvaliable();
    }
  }

  /// it provides to signin with firebase
  Future<void> signinUser({
    required UserSigninInputModel signInInputModel,
  }) async {
    await Provider.of<AuthViewModel>(context, listen: false)
        .signinUser(signInInputModel: signInInputModel);
  }

  /// it provides to signin with google
  Future<void> signinUserWithGoogle() async {
    await Provider.of<AuthViewModel>(context, listen: false).signinWithGoogle();
  }

  /// it provides to signin with apple
  Future<void> signinUserWithApple() async {
    await Provider.of<AuthViewModel>(context, listen: false).signinWithApple();
  }

  ///it used to validate the form fields
  void validateFields() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isRequestAvaible = true;
      });
    } else {
      setState(() {
        /// burası gereksiz. tekrar kontrol et sonra kaldır.
        //    isAutoValidateSignin = AutovalidateMode.always;
      });
    }
  }

  ///it used to control obsecure text for password field
  void changeObsecureText() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  ///it used to control request avaliability
  void makeFalseIsRequestAvaliable() {
    setState(() {
      isRequestAvaible = false;
    });
  }
}

import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter/material.dart';

mixin SignupViewMixin on State<SignupView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
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
    usernameController = TextEditingController();
    validators = AppValidators();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  ///it used to show failures in SnackBar
  void showScaffoldSnackBar({required Failure? failure});

  /// it works when user click sign up button
  Future<void> signupButtonOnPressed() async {
    FocusScope.of(context).unfocus();
    valiadateFields();
    if (isRequestAvaible) {
      await signupUser(
        signUpInputModel: UserSignUpInputModel(
          email: emailController.text,
          password: passwordController.text,
          username: usernameController.text,
        ),
      );
      makeFalseIsRequestAvaliable();
    }
  }

  /// it provides to signup with firebase
  Future<void> signupUser({
    required UserSignUpInputModel signUpInputModel,
  }) async {
    await Provider.of<AuthViewModel>(context, listen: false)
        .signupUser(signUpInputModel: signUpInputModel);
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
  void valiadateFields() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isRequestAvaible = true;
      });
    } else {
      setState(() {
        isAutoValidateSignin = AutovalidateMode.always;
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

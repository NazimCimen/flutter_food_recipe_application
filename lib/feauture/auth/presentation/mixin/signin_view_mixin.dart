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
  FocusNode focusNode = FocusNode();

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

  /// it works when user click sign in button
  Future<void> signinButtonOnPressed() async {
    validateFields();
    if (isRequestAvaible) {
      AppDialogs.showMyDialog(context: context, condition: true);
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
    AppDialogs.showMyDialog(context: context, condition: true);
    await Provider.of<AuthViewModel>(context, listen: false).signinWithGoogle();
  }

  /// it provides to signin with apple
  Future<void> signinUserWithApple() async {
    AppDialogs.showMyDialog(context: context, condition: true);
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

  ///it used to show failures in SnackBar
  void showScaffoldSnackBar(Failure? failure) {
    if (failure != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: ${failure.errorMessage}')),
        );
        Provider.of<AuthViewModel>(context, listen: false).clearFailure();
        await Future<void>.delayed(const Duration(seconds: 1));
        NavigatorService.goBack();
      });
    }
  }
}

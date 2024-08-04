import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> with SignupViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Stack(
        children: [
          SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: context.dynamicHeight(1),
              child: Column(
                children: [
                  SizedBox(height: context.dynamicHeight(0.05)),
                  Padding(
                    padding: context.paddingHorizAllMedium,
                    child: NavigateSignInOrUpWidget(
                      backButtonOnTap: () {
                        NavigatorService.pushNamedAndRemoveUntil(
                          AppRoutes.homeView,
                        );
                      },
                      navigateButtonOnTap: () {
                        NavigatorService.pushNamedAndRemoveUntil(
                          AppRoutes.loginView,
                        );
                      },
                      text: StringConstants.alreadyHaveAccount,
                      buttonText: StringConstants.login,
                    ),
                  ),
                  SizedBox(height: context.dynamicHeight(0.02)),
                  Expanded(
                    child: _buildContainerSignupFields(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildContainerSignupFields(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: context.borderRadiusTopLarge,
        border: Border(
          top: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      child: Padding(
        padding: context.paddingAllMedium,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthCustomTitleTextWidget(
                text: StringConstants.signUpTitle,
              ),
              AuthCustomSubTitleTextWidget(
                text: StringConstants.signUpSubtitle,
              ),
              SizedBox(height: context.dynamicHeight(0.03)),
              CustomTextFieldWidget(
                labelText: StringConstants.username,
                keyboardType: TextInputType.text,
                controller: usernameController,
                prefixIconData: Icons.alternate_email,
                validator: (value) => validators.usernameValidator(value),
              ),
              SizedBox(height: context.dynamicHeight(0.03)),
              CustomTextFieldWidget(
                labelText: StringConstants.email,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                prefixIconData: Icons.mail_outline_rounded,
                validator: (value) => validators.emailValidator(value),
              ),
              SizedBox(height: context.dynamicHeight(0.03)),
              CustomPasswordFormField(
                controller: passwordController,
                labelText: StringConstants.password,
                obsecureText: obsecureText,
                changeObsecureText: changeObsecureText,
                validator: (value) => validators.passwordValidator(value),
              ),
              SizedBox(height: context.dynamicHeight(0.02)),
              CustomAuthButtonWidget(
                onPressed: signupButtonOnPressed,
                text: StringConstants.signUpButton,
                buttonColor: Theme.of(context).colorScheme.primary,
                isRequestAvaliable: isRequestAvaible,
              ),
              SizedBox(height: context.dynamicHeight(0.02)),
              AuthPreferencesWidget(
                onPressedGoogle: signinUserWithGoogle,
                onPressedApple: signinUserWithApple,
              ),
              _buildErrorListener(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorListener(BuildContext context) {
    return Selector<AuthViewModel, Failure?>(
      selector: (_, viewModel) => viewModel.failure,
      builder: (context, failure, child) {
        showScaffoldSnackBar(failure);
        return const SizedBox.shrink();
      },
    );
  }
}

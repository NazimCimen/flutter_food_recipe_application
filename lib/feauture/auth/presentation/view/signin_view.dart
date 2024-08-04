import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> with SigninViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Stack(
        children: [
          Image.asset(
            ImageEnums.authBackgroundImage.toPathPng,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: context.dynamicHeight(1),
              child: Column(
                children: [
                  SizedBox(height: context.dynamicHeight(0.04)),
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
                          AppRoutes.signupView,
                        );
                      },
                      text: StringConstants.dontHaveAccount,
                      buttonText: StringConstants.signUp,
                    ),
                  ),
                  _buildStackFoodImages(context),
                  Expanded(
                    child: _buildContainerLoginFields(context),
                  ),
                  _buildErrorListener(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildContainerLoginFields(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AuthCustomTitleTextWidget(
                  text: StringConstants.loginTitle,
                ),
                AuthCustomSubTitleTextWidget(
                  text: StringConstants.loginSubtitle,
                ),
                SizedBox(height: context.dynamicHeight(0.01)),
                CustomTextFieldWidget(
                  labelText: StringConstants.email,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  prefixIconData: Icons.mail_outline_rounded,
                  validator: (value) => validators.emailValidator(value),
                ),
                SizedBox(height: context.dynamicHeight(0.01)),
                CustomPasswordFormField(
                  controller: passwordController,
                  labelText: StringConstants.password,
                  obsecureText: obsecureText,
                  changeObsecureText: changeObsecureText,
                  validator: (value) => validators.passwordValidator(value),
                ),
                SizedBox(height: context.dynamicHeight(0.02)),
                Center(
                  child: Text(
                    StringConstants.forgotPassword,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
                SizedBox(height: context.dynamicHeight(0.02)),
                CustomAuthButtonWidget(
                  onPressed: signinButtonOnPressed,
                  text: StringConstants.loginButton,
                  buttonColor: Theme.of(context).colorScheme.primary,
                  isRequestAvaliable: isRequestAvaible,
                ),
                SizedBox(height: context.dynamicHeight(0.02)),
                Padding(
                  padding: context.paddingHorizAllLow,
                  child: AuthPreferencesWidget(
                    onPressedGoogle: signinUserWithGoogle,
                    onPressedApple: signinUserWithApple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack _buildStackFoodImages(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          ImageEnums.yellowSemiCircle.toPathPng,
          fit: BoxFit.cover,
          height: context.dynamicHeight(0.28),
        ),
        ImageSlideshow(
          indicatorBackgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Image.asset(
              ImageEnums.food1.toPathPng,
              height: context.dynamicHeight(0.2),
            ),
            Image.asset(
              ImageEnums.food2.toPathPng,
              height: context.dynamicHeight(0.2),
            ),
            Image.asset(
              ImageEnums.food3.toPathPng,
              height: context.dynamicHeight(0.2),
            ),
          ],
        ),
      ],
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

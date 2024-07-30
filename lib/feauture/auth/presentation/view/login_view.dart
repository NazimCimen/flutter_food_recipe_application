import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/auth/presentation/widgets/auth_preferences_widget.dart';
import 'package:flutter_food_recipe_application/feauture/auth/presentation/widgets/custom_auth_button.dart';
import 'package:flutter_food_recipe_application/feauture/auth/presentation/widgets/custom_password_field_widget.dart';
import 'package:flutter_food_recipe_application/feauture/auth/presentation/widgets/custom_text_field_widget.dart';
import 'package:flutter_food_recipe_application/feauture/home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Padding(
          padding: context.paddingAllMedium,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.dynamicHeight(0.04),
                ),
                buildTitleText(
                  context: context,
                  text: 'Merhaba',
                ),
                buildSubtitleText(
                  context: context,
                  text: 'Lezzetli anlar için hazır mısınız?',
                ),
                SizedBox(height: context.dynamicHeight(0.03)),
                CustomTextFieldWidget(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                  validator: null,
                ),
                SizedBox(height: context.dynamicHeight(0.03)),
                CustomPasswordFormField(
                  controller: TextEditingController(),
                  hintText: 'Şifre',
                ),
                SizedBox(height: context.dynamicHeight(0.02)),
                CustomAuthButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ));
                  },
                  text: 'GİRİŞ YAP',
                  buttonColor: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: context.dynamicHeight(0.02)),
                AuthPreferencesWidget(
                  navigateToFirst: ' Kayıtlı bir hesabın yok mu?',
                  navigateToSecond: 'Kayıt ol',
                  owWith: 'YA DA',
                  pressNavigate: () {
                    /*  Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupView(),
                        ));*/
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Text buildSubtitleText(
      {required BuildContext context, required String text}) {
    return Text(text, style: Theme.of(context).textTheme.headlineSmall);
  }

  Text buildTitleText({required BuildContext context, required String text}) {
    return Text(text, style: Theme.of(context).textTheme.headlineMedium);
  }
}

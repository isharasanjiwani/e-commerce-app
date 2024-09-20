import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/common/helper/navigator/app_navigator.dart';
import 'package:flutter_project/common/widget/appbar/app_bar.dart';
import 'package:flutter_project/presentation/auth/pages/forgot_password.dart';

import '../../../common/widget/basic_app_button.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 40
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signInText(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 20,),
            _continueButton(),
            const SizedBox(height: 20,),
            _forgotPassword(context)
          ],
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context){
    return const Text(
      'Sign in',
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _passwordField(BuildContext context){
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Password',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
    );
  }

  Widget _continueButton() {
    return BasicAppButton(
      onPressed: (){},
      title: 'Continue',
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: [
            const TextSpan(
                text: 'Forgot Password?'
            ),
            TextSpan(
                text: 'Reset',
                recognizer: TapGestureRecognizer()..onTap = () {
                  AppNavigator.push(context, const ForgotPasswordPage());
                },
                style: const TextStyle(
                    fontWeight: FontWeight.bold
                )
            )
          ]
      ),
    );
  }
}

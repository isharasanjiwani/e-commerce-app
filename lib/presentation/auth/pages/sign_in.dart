import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/common/helper/navigator/app_navigator.dart';
import 'package:flutter_project/common/widget/appbar/app_bar.dart';
import 'package:flutter_project/data/auth/models/user_sign_in_req.dart';
import 'package:flutter_project/presentation/auth/pages/enter_password.dart';
import 'package:flutter_project/presentation/auth/pages/sign_up.dart';

import '../../../common/widget/button/basic_app_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(hideBack: true,),
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
            _emailField(context),
            const SizedBox(height: 20,),
            _continueButton(context),
            const SizedBox(height: 20,),
            _createAccount(context)
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

  Widget _emailField(BuildContext context){
    return TextField(
      controller: emailCon,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: (){
        AppNavigator.pushReplacement(
            context,
            EnterPasswordPage(
              userSignInReq: UserSignInReq(
                  email: emailCon.text
              )
            ));
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
              text: 'Don\'t you have an account? '
          ),
          TextSpan(
            text: 'Create One',
            recognizer: TapGestureRecognizer()..onTap = () {
              AppNavigator.push(context, SignUpPage());
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

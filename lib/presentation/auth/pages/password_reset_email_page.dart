import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/auth/pages/sign_in.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widget/button/basic_app_button.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          const SizedBox(height: 30),
          _sentEmail(),
          const SizedBox(height: 30),
          _returnToLoginButton(context)
        ],
      ),
    );
  }

  Widget _emailSending(){
    return const Center(
      child: Text("vector image"),
    );
  }

  Widget _sentEmail() {
    return const Center(
      child: Text(
          'We Sent you an Email to reset your password.'
      ),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
        onPressed: (){
          AppNavigator.pushReplacement(context, SignInPage());
        },
        width: 200,
        title: 'Return to Login'
    );
  }
}

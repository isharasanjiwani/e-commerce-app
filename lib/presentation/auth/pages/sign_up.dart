import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/common/helper/navigator/app_navigator.dart';
import 'package:flutter_project/common/widget/appbar/app_bar.dart';
import 'package:flutter_project/data/auth/models/user_creation_req.dart';
import 'package:flutter_project/presentation/auth/pages/sign_in.dart';

import '../../../common/widget/button/basic_app_button.dart';
import 'gender_and_age_selection.dart';

class SignUpPage extends StatelessWidget {

  SignUpPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 40
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signInText(context),
            const SizedBox(height: 20,),
            _firstNameField(context),
            const SizedBox(height: 20,),
            _lastNameField(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
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
      'Create Account',
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _firstNameField(BuildContext context){
    return TextField(
      controller: _firstNameCon,
      decoration: const InputDecoration(
        hintText: 'First Name',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
    );
  }

  Widget _lastNameField(BuildContext context){
    return TextField(
      controller: _lastNameCon,
      decoration: const InputDecoration(
        hintText: 'Last Name',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
    );
  }

  Widget _emailField(BuildContext context){
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
    );
  }

  Widget _passwordField(BuildContext context){
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
    );
  }



  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: (){
        AppNavigator.pushReplacement(
            context,
            GenderAndAgeSelectionPage(
              userCreationReq: UserCreationReq(
                  firstName: _firstNameCon.text,
                  lastName: _lastNameCon.text,
                  email: _emailCon.text,
                  password: _passwordCon.text
              ),
            )
        );
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: [
            const TextSpan(
                text: 'Do you have an account? '
            ),
            TextSpan(
                text: 'SignIn',
                recognizer: TapGestureRecognizer()..onTap = () {
                  AppNavigator.pushReplacement(context, SignInPage());
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
